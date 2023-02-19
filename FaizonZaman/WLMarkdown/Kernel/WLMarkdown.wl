(* ::Package:: *)

BeginPackage["FaizonZaman`WLMarkdown`"]

(* Declare your package's public symbols here. *)

ImportMarkdown::usage = "ImportMarkdown[s] imports string s into symbolic markdown\nImportMarkdown[f] imports file f into symbolic markdown"
TokenRules::usage = "TokenRules[f] gives the line tokenization rules for Markdown flavor f"
DelimiterRules::usage = "DelimiterRules[f] gives the sub line tokenization rules for Markdown flavor f"
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
			Confirm[ drules = DelimiterRules[ flavor ], StringTemplate[ DelimiterRules::invf ][ flavor ] ];
			Confirm[ prules = ParserRules[ flavor ], StringTemplate[ TokenRules::invf ][ flavor ] ];
			
			(* tokens = MarkdownLexer[ lines,  trules ]; *) (* Stage 1 - Tokenize Lines *)
			(* tokens = MarkdownLexer[ tokens, drules ]; *) (* Stage 2 - Tokenize Data *)
			tokens = MarkdownLexer[ lines, trules, drules ]

			(* parse  = MarkdownParser[tokens, opts]; *)    (* Stage 3 - Parse Blocks *)
		]
	]

MarkdownToken[asc_?AssociationQ][key_String] := Lookup[asc, key]


MarkdownLexer[ data_, trules_List, drules_List] := Block[
	{linetokens},
	linetokens = LineLexer[data, trules];
	linetokens = DataLexer[linetokens, drules];
	linetokens
	]
(* Stage 1 *)
LineLexer[ line_String, rules_List ] := iLineLexer[ line, rules ]
LineLexer[ lines:List[__String], rules_List ] := Map[ iLineLexer[ #, rules ]&, lines ]
iLineLexer[ line_String, rules_List ] := Splice[ StringSplit[ line, rules ] ]

(* Stage 2 *)
$SubTokens = "Line"|"Heading"(* |"Footnote"|"Image" *);
DataLexer[ tokens:List[__MarkdownToken], rules_List ] := Map[ iDataLexer[ #, rules ]&, tokens ]
iDataLexer[ MarkdownToken[token: KeyValuePattern[{"Token" -> $SubTokens, "Data" -> data_}]], srules_List ] := MarkdownToken[ ReplacePart[ token, Key["Data"] -> iDataLexer[ data, srules ] ] ]
iDataLexer[ token_MarkdownToken, _ ] := token
iDataLexer[ data_String, srules_List ] := iDataLexer[ DelimiterLexer[ data, srules ], srules ]
iDataLexer[ { subline_String }, _ ] := subline
iDataLexer[ subline_List, srules_List ] := Map[ iDataLexer[ #, srules ]&, subline ]

DelimiterLexer[ data_String, rules_List ] := Block[
 	{res},
 	res = StringSplit[data, rules] /. "" -> Nothing;
	SequenceReplace[res, { seq : {MarkdownToken[KeyValuePattern["Data" -> s_]] ..} :> MarkdownToken[<|"Token" -> "Delimiter", "Data" -> StringRepeat[s, Length[seq]]|>]}]
	]

(* MarkdownParser[ tokens_List, rules_List ] := SequenceReplace[ tokens, rules ] *)

End[]

EndPackage[]
