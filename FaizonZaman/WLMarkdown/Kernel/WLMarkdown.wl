(* ::Package:: *)

BeginPackage["FaizonZaman`WLMarkdown`"]

(* Declare your package's public symbols here. *)

ImportMarkdown::usage = "ImportMarkdown[s] imports string s into symbolic markdown\nImportMarkdown[f] imports file f into symbolic markdown"
TokenRules::usage = "TokenRules[f] gives the line tokenization rules for Markdown flavor f"
SubTokenRules::usage = "SubTokenRules[f] gives the sub line tokenization rules for Markdown flavor f"
MarkdownLexer::usage = "MarkdownLexer[s,r] lexes the string s with rules r\nMarkdownLexer[ls, r] lexes the list of strings ls with rules r"
MarkdownToken::usage = "Represents a lexed Markdown token"
MarkdownElement::usage = "Represents a symbolic Markdown element"

$MarkdownIndentationSize::usage = "The string length of a single indent"

Begin["`Private`"]

$MarkdownIndentationSize = Automatic;

Needs["FaizonZaman`WLMarkdown`TokenRules`"]

(* ImportMarkdown *)
Options[ImportMarkdown] = {
	"Flavor" -> Automatic
};

ImportMarkdown[ string_String, opts:OptionsPattern[ ImportMarkdown ] ] := iImportMarkdown[ string, opts ]

ImportMarkdown[ file_File?FileExistsQ, opts:OptionsPattern[ ImportMarkdown ] ] := Module[
	{data = Import[ file, "Text" ]},
	iImportMarkdown[ data, opts ]
	]

iImportMarkdown[ source_String, opts:OptionsPattern[ ImportMarkdown ] ] :=
	Module[
		{
			lines = StringSplit[ source, "\n" ], tokens, trules, parse, prules,
			flavor = Replace[ OptionValue[ "Flavor" ], Automatic -> "CommonMark" ]
			},
		Enclose[
			Confirm[ trules = TokenRules[ flavor ], StringTemplate[ TokenRules::invf ][ flavor ] ];
			Confirm[ srules = SubTokenRules[ flavor ], StringTemplate[ SubTokenRules::invf ][ flavor ] ];
			Confirm[ prules = ParserRules[ flavor ], StringTemplate[ TokenRules::invf ][ flavor ] ];
			
			tokens = MarkdownLexer[ lines,  trules ]; (* Stage 1 - Tokenize Lines *)
			tokens = MarkdownLexer[ tokens, srules ]  (* Stage 2 - SubTokenize Lines *)

			(* parse  = MarkdownParser[tokens, opts]; *)    (* Stage 3 - Parse Blocks *)
		]
	]

MarkdownToken[asc_?AssociationQ][key_String] := Lookup[asc, key]

(* Stage 1 *)
MarkdownLexer[ line_String, rules_List ] := iMarkdownLexer[ line, rules ]
MarkdownLexer[ lines:List[__String], rules_List ] := Map[ iMarkdownLexer[ #, rules ]&, lines ]
iMarkdownLexer[ line_String, rules_List ] := Splice[ StringSplit[ line, rules ] ]

(* Stage 2 *)
$SubTokens = "Line"|"Heading"|"Italic"|"Bold"(* |"Footnote"|"Image" *);
MarkdownLexer[ tokens:List[__MarkdownToken], rules_List ] := Map[ sMarkdownLexer[ #, rules ]&, tokens ]
sMarkdownLexer[ MarkdownToken[token: KeyValuePattern[{"Token" -> $SubTokens, "Data" -> data_}]], srules_List ] := MarkdownToken[ ReplacePart[ token, Key["Data"] -> sMarkdownLexer[ data, srules ] ] ]
sMarkdownLexer[ token_MarkdownToken, _ ] := token
sMarkdownLexer[ subline_String, srules_List ] := sMarkdownLexer[ StringSplit[ subline, srules ], srules ]
sMarkdownLexer[ { subline_String }, _ ] := subline
sMarkdownLexer[ subline_List, srules_List ] := Map[ sMarkdownLexer[ #, srules ]&, subline ]

(* MarkdownParser[ tokens_List, rules_List ] := SequenceReplace[ tokens, rules ] *)

End[]

EndPackage[]
