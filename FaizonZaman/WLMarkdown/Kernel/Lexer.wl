BeginPackage["FaizonZaman`WLMarkdown`Lexer`"]
(* No Public Symbols *)
Begin["`Private`"]

FaizonZaman`WLMarkdown`MarkdownLexer[data_String, rules_] := FaizonZaman`WLMarkdown`MarkdownLexer[ {data}, rules ]
FaizonZaman`WLMarkdown`MarkdownLexer[ data_List, rules:KeyValuePattern[{"LineRules"->_, "LinkRules"->_, "BlockRules"->_, "DelimiterRules"->_}]] := Block[
	{res},
	(*  Stage 1 *) res = LineLexer[data, rules["LineRules"]];
	(*  Stage 2 *) res = LinkLexer[res, rules["LinkRules"]];
	(*  Stage 3 *) res = BlockLexer[res, rules["BlockRules"]];
	(*  Stage 4 *) res = DelimiterLexer[res, rules["DelimiterRules"]];
	res
	]

(* Stage 1 *)
LineLexer[ line_String, rules_List ] := iLineLexer[ line, rules ]
LineLexer[ lines:List[__String], rules_List ] := Map[ iLineLexer[ #, rules ]&, lines ] ~Join~ { FaizonZaman`WLMarkdown`MarkdownToken[<|"Token" -> "EndOfFile"|>] }
iLineLexer[ line_String, rules_List ] := Splice[ StringSplit[ line, rules ] ]

(* Stage 2 *)
NormStringSplit[{s_String}] := s
NormStringSplit[expr_] := expr
$LinkLexableTokens = "Line"|"Heading"|"OrderedListItem"|"UnorderedListItem";
LinkLexer[ lines:List[__FaizonZaman`WLMarkdown`MarkdownToken], rules_List ] := MapAt[ iLinkLexer[ #, rules ]&, lines, Position[lines, FaizonZaman`WLMarkdown`MarkdownToken[KeyValuePattern[ "Token" -> $LinkLexableTokens ]]] ]
iLinkLexer[ FaizonZaman`WLMarkdown`MarkdownToken[token: KeyValuePattern[{"Token" -> $LinkLexableTokens, "Data" -> data_}]], rules_List ] := FaizonZaman`WLMarkdown`MarkdownToken[ ReplacePart[ token, Key["Data"] -> NormStringSplit@StringSplit[ data, rules ] ] ]
(* iLinkLexer[ token_MarkdownToken, _ ] := token *)

(* Stage 3 *)
BlockLexer[ lines_List, rules_List] := FixedPoint[ SequenceReplace[rules], lines ]

(* Stage 4 *)
$DelimiterLexableLines = "Line"|"Heading"|"Quote"|"BlockQuote"|"UnorderedListItem"|"OrderedListItem";
$DelimiterLexableBlocks = "UnorderedList"|"OrderedList"|"Table";
$DelimiterLexableTokens = Join[$DelimiterLexableLines, $DelimiterLexableBlocks];
DelimiterLexer[ tokens:List[__FaizonZaman`WLMarkdown`MarkdownToken], rules_List ] := Replace[ tokens, token:FaizonZaman`WLMarkdown`MarkdownToken[KeyValuePattern[{"Token" -> $DelimiterLexableTokens}]] :> iDelimiterLexer[ token, rules ], 1 ]
iDelimiterLexer[ FaizonZaman`WLMarkdown`MarkdownToken[token: KeyValuePattern[{"Token" -> $DelimiterLexableLines, "Data" -> data_}]], rules_List ] := FaizonZaman`WLMarkdown`MarkdownToken[ ReplacePart[ token, Key["Data"] -> iLineDelimiterLexer[ data, rules ] ] ]
iDelimiterLexer[ FaizonZaman`WLMarkdown`MarkdownToken[token: KeyValuePattern[{"Token" -> $DelimiterLexableBlocks, "Data" -> data_}]], rules_List ] := FaizonZaman`WLMarkdown`MarkdownToken[ ReplacePart[ token, Key["Data"] -> iBlockDelimiterLexer[ data, rules ] ] ]

iLineDelimiterLexer[ FaizonZaman`WLMarkdown`MarkdownToken[token:KeyValuePattern[{"Token" -> $DelimiterLexableLines, "Data" -> data_}]], rules_List ] := FaizonZaman`WLMarkdown`MarkdownToken[ ReplacePart[ token, Key["Data"] -> iLineDelimiterLexer[ sDelimiterLexer[ data, rules ], rules ] ] ]
iLineDelimiterLexer[ token_FaizonZaman`WLMarkdown`MarkdownToken, _ ] := token
iLineDelimiterLexer[ data_String, rules_List ] := iLineDelimiterLexer[ sDelimiterLexer[ data, rules ], rules ]
iLineDelimiterLexer[ { subline_String }, _ ] := subline
iLineDelimiterLexer[ subline_List, srules_List ] := Flatten[ Map[ iLineDelimiterLexer[ #, srules ]&, subline ] ]

iBlockDelimiterLexer[ block_List, srules_List ] := Map[ iLineDelimiterLexer[ #, srules ]&, block ]

sDelimiterLexer[ data_String, rules_List ] := Block[
 	{res},
 	res = StringSplit[data, rules] /. "" -> Nothing;
	res = SequenceReplace[res, { seq : {FaizonZaman`WLMarkdown`MarkdownToken[KeyValuePattern["Data" -> s_]] ..} :> FaizonZaman`WLMarkdown`MarkdownToken[<|"Token" -> "Delimiter", "Data" -> StringRepeat[s, Length[seq]]|>]}];
	res
	]

End[]
EndPackage[]