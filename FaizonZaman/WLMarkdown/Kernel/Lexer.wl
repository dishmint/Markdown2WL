BeginPackage["FaizonZaman`WLMarkdown`Lexer`"]
(* No Public Symbols *)
Begin["`Private`"]
Needs["FaizonZaman`WLMarkdown`TokenRules`"]
FaizonZaman`WLMarkdown`MarkdownLexer[data_String, rules_] := FaizonZaman`WLMarkdown`MarkdownLexer[ {data}, rules ]
FaizonZaman`WLMarkdown`MarkdownLexer[ data_List, rules:KeyValuePattern[{"LineRules"->_, "LinkRules"->_, "BlockRules"->_, "DelimiterRules"->_}] ] := 
	Block[
		{res},
		Enclose[
			(*  Stage 1 *) res = ConfirmQuiet[LineLexer[data, rules["LineRules"]]];
			(*  Stage 2 *) res = ConfirmQuiet[LinkLexer[res, rules["LinkRules"]]];
			(*  Stage 3 *) res = ConfirmQuiet[BlockLexer[res, rules["BlockRules"]]];
			(*  Stage 4 *) res = ConfirmQuiet[DelimiterLexer[res, rules["DelimiterRules"]]];
			res
		]
	]


components=<|
	"Lines"-> {LineLexer, FaizonZaman`WLMarkdown`LineRules},
	"Links"-> {LinkLexer, FaizonZaman`WLMarkdown`LinkRules},
	"Blocks"-> {BlockLexer, FaizonZaman`WLMarkdown`BlockRules},
	"Delimiters"-> {DelimiterLexer, FaizonZaman`WLMarkdown`DelimiterRules}
	|>

FaizonZaman`WLMarkdown`MarkdownLexer[ data_List, component_String ] := Block[
	{lexer,rules,res},
	{lexer, rules} = components[component];
	res = lexer[data, rules[FaizonZaman`WLMarkdown`$MarkdownFlavor]];
	res
	]

(* Stage 1 *)
LineLexer[ line_String, rules_List ] := iLineLexer[ line, rules ]
LineLexer[ lines:List[__String], rules_List ] := 
	{
		FaizonZaman`WLMarkdown`MarkdownToken[<|"Token" -> "StartOfFile"|>],
		Splice[Map[ iLineLexer[ #, rules ]&, lines ]],
		FaizonZaman`WLMarkdown`MarkdownToken[<|"Token" -> "EndOfFile"|>]
	}
iLineLexer[ line_String, rules_List ] := Splice[ StringSplit[ line, rules ] ]

(* Stage 2 *)
NormStringSplit[{s_String}] := s
NormStringSplit[expr_] := expr
$LinkLexableTokens = "Line"|"Heading"|"OrderedListItem"|"UnorderedListItem";
LinkLexer[ lines_List, rules_List ] := MapAt[ iLinkLexer[ #, rules ]&, lines, Position[lines, FaizonZaman`WLMarkdown`MarkdownToken[KeyValuePattern[ "Token" -> $LinkLexableTokens ]]] ]
iLinkLexer[ FaizonZaman`WLMarkdown`MarkdownToken[token: KeyValuePattern[{"Token" -> $LinkLexableTokens, "Data" -> data_}]], rules_List ] := FaizonZaman`WLMarkdown`MarkdownToken[ ReplacePart[ token, Key["Data"] -> NormStringSplit@StringSplit[ data, rules ] ] ]
(* iLinkLexer[ token_MarkdownToken, _ ] := token *)

(* Stage 3 *)
BlockLexer[ lines_List, rules_List] /; (Not@*FreeQ[$TokenPattern["Section"]]):= MapAt[BlockLexer[#, rules]&, lines, Position[lines, $TokenPattern["Section"]]]
BlockLexer[ lines_List, rules_List] := FixedPoint[ SequenceReplace[rules], lines ]
(* TODO: Stage 3.2 iBlockLexer to refactor arrangements like lone section tokens *)

(* Stage 4 *)
$DelimiterLexableLines = 
	"Line"|"Heading"|"Quote"|"BlockQuote"|"UnorderedListItem"|"OrderedListItem";
$DelimiterLexableBlocks = 
	"UnorderedList"|"OrderedList"|"Table";
$DelimiterLexableTokens = 
	Join[$DelimiterLexableLines, $DelimiterLexableBlocks];

(* DelimiterLexer[ tokens:List[__FaizonZaman`WLMarkdown`MarkdownToken], rules_List ] :=  *)
DelimiterLexer[ tokens_List, rules_List ] := Block[
	{
		allDelimiterLexableTokenPositions = Position[tokens, FaizonZaman`WLMarkdown`MarkdownToken[KeyValuePattern[{"Token" -> $DelimiterLexableTokens}]]],
		exceptionPositions = Extract[{All, 1}]@Position[tokens, FaizonZaman`WLMarkdown`MarkdownToken[KeyValuePattern[{"Token" -> "CodeBlock"}]]],
		positions
	},
	positions = DeleteCases[allDelimiterLexableTokenPositions, {Alternatives @@ exceptionPositions, ___}];
	MapAt[ iDelimiterLexer[ rules ], tokens, positions]
]

iDelimiterLexer[rules:{__RuleDelayed}][expr_] := iDelimiterLexer[expr, rules]
iDelimiterLexer[ FaizonZaman`WLMarkdown`MarkdownToken[token: KeyValuePattern[{"Token" -> $DelimiterLexableBlocks, "Data" -> data_}]], rules_List ] := FaizonZaman`WLMarkdown`MarkdownToken[
	ReplacePart[ token, Key["Data"] -> iBlockDelimiterLexer[ data, rules ] ]
]

iDelimiterLexer[ FaizonZaman`WLMarkdown`MarkdownToken[token: KeyValuePattern[{"Token" -> $DelimiterLexableLines, "Data" -> data_}]], rules_List ] := FaizonZaman`WLMarkdown`MarkdownToken[
	ReplacePart[ token, Key["Data"] -> iLineDelimiterLexer[ data, rules ] ]
]

iLineDelimiterLexer[ FaizonZaman`WLMarkdown`MarkdownToken[token:KeyValuePattern[{"Token" -> $DelimiterLexableLines, "Data" -> data_}]], rules_List ] := 
	FaizonZaman`WLMarkdown`MarkdownToken[ ReplacePart[ token, Key["Data"] -> iLineDelimiterLexer[ sDelimiterLexer[ data, rules ], rules ] ] ]
	(* FaizonZaman`WLMarkdown`MarkdownToken[ ReplacePart[ token, Key["Data"] -> iLineDelimiterLexer[ MapAt[sDelimiterLexer[ #, rules ]&, data, Position[data, _String]], rules ] ] ] *)
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

sDelimiterLexer[expr_, _]:= expr

(* -------------------------------- Messages -------------------------------- *)
LineLexer[args___] := Message[LineLexer::bark, Hold[args]]
LinkLexe[args___] := Message[LineLexer::bark, Hold[args]]
BlockLexer[args___] := Message[LineLexer::bark, Hold[args]]
DelimiterLexer[args___] := Message[LineLexer::bark, Hold[args]]
(* PostLexer[args___] := Message[LineLexer::bark, Hold[args]] *)

LineLexer::bark = "Unsupported syntax ``"
LinkLexer::bark = "Unsupported syntax ``"
BlockLexer::bark = "Unsupported syntax ``"
DelimiterLexer::bark = "Unsupported syntax ``"
(* PostLexer::bark = "Unsupported syntax ``" *)

End[]
EndPackage[]