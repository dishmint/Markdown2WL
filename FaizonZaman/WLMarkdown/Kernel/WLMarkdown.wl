(* ::Package:: *)

BeginPackage["FaizonZaman`WLMarkdown`"]

(* Declare your package's public symbols here. *)

ImportMarkdown::usage = "ImportMarkdown[s] imports string s into symbolic markdown\nImportMarkdown[f] imports file f into symbolic markdown"
LineRules::usage = "LineRules[f] gives the line tokenization rules for Markdown flavor f"
LinkRules::usage = "LinkRules[f] gives the line tokenization rules for Markdown flavor f"
BlockRules::usage = "BlockRules[f] gives the block tokenization rules for Markdown flavor f"
DelimiterRules::usage = "DelimiterRules[f] gives the delimiter tokenization rules for Markdown flavor f"
MarkdownDelimiters::usage = "MarkdownDelimiters[f] gives the delimiters for Markdown flavor f"
MarkdownLexer::usage = "MarkdownLexer[s,r] lexes the string s with rules r\nMarkdownLexer[ls, r] lexes the list of strings ls with rules r"
MarkdownToken::usage = "Represents a lexed Markdown token"
MarkdownElement::usage = "Represents a symbolic Markdown element"

(* $MarkdownIndentationSize::usage = "The string length of a single indent" *)

Begin["`Private`"]

(* $MarkdownIndentationSize = Automatic; *)

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
			Confirm[ lrules = LineRules[ flavor ], StringTemplate[ LineRules::invf ][ flavor ] ];
			Confirm[ hrules = LinkRules[ flavor ], StringTemplate[ LinkRules::invf ][ flavor ] ];
			Confirm[ brules = BlockRules[ flavor ], StringTemplate[ BlockRules::invf ][ flavor ] ];
			Confirm[ drules = DelimiterRules[ flavor ], StringTemplate[ DelimiterRules::invf ][ flavor ] ];
			Confirm[ prules = ParserRules[ flavor ], StringTemplate[ ParserRules::invf ][ flavor ] ];

			tokens = MarkdownLexer[ lines, AssociationThread[ { "LineRules", "LinkRules", "BlockRules", "DelimiterRules" } -> { lrules, hrules, brules, drules}]]

			(* parse  = MarkdownParser[tokens, prules]; *)    (* Stage 3 - Parse Blocks *)
		]
	]

MarkdownToken[asc_?AssociationQ][key_String] := Lookup[asc, key]


MarkdownLexer[ data_, rules:KeyValuePattern[{"LineRules"->_, "LinkRules"->_, "BlockRules"->_, "DelimiterRules"->_}]] := Block[
	{res},
	(*  Stage 1 *) res = LineLexer[data, rules["LineRules"]];
	(*  Stage 2 *) res = LinkLexer[res, rules["LinkRules"]];
	(*  Stage 3 *) res = BlockLexer[res, rules["BlockRules"]];
	(*  Stage 4 *) (* res = DataLexer[res, rules["DelimiterRules"]]; *)
	res
	]

(* Stage 1 *)
LineLexer[ line_String, rules_List ] := iLineLexer[ line, rules ]
LineLexer[ lines:List[__String], rules_List ] := Map[ iLineLexer[ #, rules ]&, lines ]
iLineLexer[ line_String, rules_List ] := Splice[ StringSplit[ line, rules ] ]

(* Stage 2 *)
NormStringSplit[{s_String}] := s
NormStringSplit[expr_] := expr
$LinkLexableTokens = "Line"|"Heading"|"OrderedListItem"|"UnorderedListItem";
LinkLexer[ lines:List[__MarkdownToken], rules_List ] := Map[ iLinkLexer[ #, rules ]&, lines ]
iLinkLexer[ MarkdownToken[token: KeyValuePattern[{"Token" -> $LinkLexableTokens, "Data" -> data_}]], rules_List ] := MarkdownToken[ ReplacePart[ token, Key["Data"] -> NormStringSplit@StringSplit[ data, rules ] ] ]
iLinkLexer[ token_MarkdownToken, _ ] := token
(* NOTE: Might not want the LInkLexer to run before the BlockLexer because you might not want links in CodeBlocks, but I suppose the tokenization could be reversed in parsing *)

(* Stage 3 *)
BlockLexer[ lines_List, rules_List] := FixedPoint[ SequenceReplace[rules], lines ]

(* Stage 4 *)
$DataLexableTokens = "Line"|"Heading"|"Table";
DataLexer[ tokens:List[__MarkdownToken], rules_List ] := Map[ iDataLexer[ #, rules ]&, tokens ]
iDataLexer[ MarkdownToken[token: KeyValuePattern[{"Token" -> $DataLexableTokens, "Data" -> data_}]], rules_List ] := MarkdownToken[ ReplacePart[ token, Key["Data"] -> iDataLexer[ data, rules ] ] ]
iDataLexer[ token_MarkdownToken, _ ] := token
iDataLexer[ data_String, rules_List ] := iDataLexer[ DelimiterLexer[ data, rules ], rules ]
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
