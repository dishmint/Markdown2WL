(* ::Package:: *)

BeginPackage["FaizonZaman`WLMarkdown`"]

(* Declare your package's public symbols here. *)

ImportMarkdown::usage = "ImportMarkdown[s] imports string s into symbolic markdown\nImportMarkdown[f] imports file f into symbolic markdown"
LineRules::usage = "LineRules[f] gives the line tokenization rules for Markdown flavor f"
LinkRules::usage = "LinkRules[f] gives the line tokenization rules for Markdown flavor f"
BlockRules::usage = "BlockRules[f] gives the block tokenization rules for Markdown flavor f"
DelimiterRules::usage = "DelimiterRules[f] gives the delimiter tokenization rules for Markdown flavor f"
MarkdownRules::usage = "MarkdownRules[f] gives the tokenization rules for Markdown flavor f"
MarkdownDelimiters::usage = "MarkdownDelimiters[f] gives the delimiters for Markdown flavor f"
MarkdownLexer::usage = "MarkdownLexer[s,r] lexes the string s with rules r\nMarkdownLexer[ls, r] lexes the list of strings ls with rules r"
MarkdownToken::usage = "Represents a lexed Markdown token"
MarkdownElement::usage = "Represents a symbolic Markdown element"

(* $MarkdownIndentationSize::usage = "The string length of a single indent" *)

Begin["`Private`"]

(* $MarkdownIndentationSize = Automatic; *)

Needs["FaizonZaman`WLMarkdown`TokenRules`"]

(* MarkdownRules *)
$MarkdownFlavors = Alternatives["CommonMark"]
MarkdownRules[flavor:$MarkdownFlavors] := AssociationThread[{"LineRules", "LinkRules", "BlockRules", "DelimiterRules", "ParserRules" } -> Through[{LineRules, LinkRules, BlockRules, DelimiterRules, ParserRules}[flavor]]]
MarkdownRules[flavor_] := (Message[MarkdownRules::invf, flavor];$Failed)
MarkdownRules::invf = "No line markdown rules defined for flavor \"``\""

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


MarkdownLexer[data_String, rules_] := MarkdownLexer[ {data}, rules ]
MarkdownLexer[ data_List, rules:KeyValuePattern[{"LineRules"->_, "LinkRules"->_, "BlockRules"->_, "DelimiterRules"->_}]] := Block[
	{res},
	(*  Stage 1 *) res = LineLexer[data, rules["LineRules"]];
	(*  Stage 2 *) res = LinkLexer[res, rules["LinkRules"]];
	(*  Stage 3 *) res = BlockLexer[res, rules["BlockRules"]];
	(*  Stage 4 *) res = DelimiterLexer[res, rules["DelimiterRules"]];
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
LinkLexer[ lines:List[__MarkdownToken], rules_List ] := MapAt[ iLinkLexer[ #, rules ]&, lines, Position[lines, MarkdownToken[KeyValuePattern[ "Token" -> $LinkLexableTokens ]]] ]
iLinkLexer[ MarkdownToken[token: KeyValuePattern[{"Token" -> $LinkLexableTokens, "Data" -> data_}]], rules_List ] := MarkdownToken[ ReplacePart[ token, Key["Data"] -> NormStringSplit@StringSplit[ data, rules ] ] ]
(* iLinkLexer[ token_MarkdownToken, _ ] := token *)

(* Stage 3 *)
BlockLexer[ lines_List, rules_List] := FixedPoint[ SequenceReplace[rules], lines ]

(* Stage 4 *)
(* The data lexer handles delimiters *)
$DelimiterLexableLines = "Line"|"Heading"|"Quote"|"BlockQuote"|"UnorderedListItem"|"OrderedListItem";
$DelimiterLexableBlocks = "UnorderedList"|"OrderedList"|"Table";
$DelimiterLexableTokens = Join[$DelimiterLexableLines, $DelimiterLexableBlocks];
DelimiterLexer[ tokens:List[__MarkdownToken], rules_List ] := MapAt[ iDelimiterLexer[ #, rules ]&, tokens, Position[ tokens, MarkdownToken[KeyValuePattern[{"Token" -> $DelimiterLexableTokens}]]] ]
iDelimiterLexer[ MarkdownToken[token: KeyValuePattern[{"Token" -> $DelimiterLexableLines, "Data" -> data_}]], rules_List ] := MarkdownToken[ ReplacePart[ token, Key["Data"] -> iLineDelimiterLexer[ data, rules ] ] ]
iDelimiterLexer[ MarkdownToken[token: KeyValuePattern[{"Token" -> $DelimiterLexableBlocks, "Data" -> data_}]], rules_List ] := MarkdownToken[ ReplacePart[ token, Key["Data"] -> iBlockDelimiterLexer[ data, rules ] ] ]

iLineDelimiterLexer[ token_MarkdownToken, _ ] := token
iLineDelimiterLexer[ data_String, rules_List ] := iLineDelimiterLexer[ sDelimiterLexer[ data, rules ], rules ]
iLineDelimiterLexer[ { subline_String }, _ ] := subline
iLineDelimiterLexer[ subline_List, srules_List ] := Flatten[ Map[ iLineDelimiterLexer[ #, srules ]&, subline ] ]

iBlockDelimiterLexer[ block_List, srules_List ] := Map[ iLineDelimiterLexer[ #, srules ]&, block ]

sDelimiterLexer[ data_String, rules_List ] := Block[
 	{res},
 	res = StringSplit[data, rules] /. "" -> Nothing;
	res = SequenceReplace[res, { seq : {MarkdownToken[KeyValuePattern["Data" -> s_]] ..} :> MarkdownToken[<|"Token" -> "Delimiter", "Data" -> StringRepeat[s, Length[seq]]|>]}];
	res
	]

(* MarkdownParser[ tokens_List, rules_List ] := SequenceReplace[ tokens, rules ] *)

End[]

EndPackage[]
