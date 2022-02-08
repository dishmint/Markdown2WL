(* ::Package:: *)

BeginPackage["WLMarkdown`"]

(* Declare your package's public symbols here. *)

MarkdownParse::usage = "MarkdownParse[file.md] parses file.md into symbolic markdown"
MarkdownElement::usage = "Represents an element in Symbolic Markdown"

TokenizeMarkdownString::usage = "TokenizeMarkdownString[s] parses s into its MarkdownElement constituents"
TokenizeMarkdownBlock::usage = "TokenizeMarkdownBlock[s] parses s into its MarkdownElement constituents"

Begin["`Private`"]

(* Parser *)

(* \[LongDash] Utilities *)

TokenizeBlock[source_] := Module[
	{lines, spos},
	(* Convert empty lines to MarkdownElements *)
	lines = StringSplit[source, RegularExpression["(?m)^\\s*$"] -> MarkdownElement["Line", {}]];
	(* Get the positions of the remaining strings *)
	spos = Position[lines, _String, 1];
	(* StringTrim them *)
	SubsetMap[Map[(StringTrim[#, "\n"] &) /* TokenizeMarkdownBlock], lines, spos]
	]

iTokenizeLines = Map[Apply[(StringSplit[#, "\n"] &) /* Map[TokenizeMarkdownString] /*(Flatten[#, 1] &)]]

TokenizeLine[blocks_] := Module[
	{lpos},
	lpos = Position[blocks, List[_String], 1];
	SubsetMap[iTokenizeLines, blocks, lpos]
	]

PostTokenize[tlines_] := Module[
	{lpos},
		lpos = Position[tlines, _List, 1];
		SubsetMap[Map[MarkdownElement["Line", #]&], tlines, lpos]
		]

Options[GetIndentationLevel] = {
	"IndentLength" -> 2
};

GetIndentationLevel["", _] := 0
GetIndentationLevel[lead_String, "Tabs", OptionsPattern[]] := StringLength[lead]
GetIndentationLevel[lead_String, "Whitespace", OptionsPattern[]] := StringLength[lead]/OptionValue["IndentLength"]

GetIndentationType[""] := None
GetIndentationType[s_String] /;StringMatchQ[RegularExpression["^\\t+"]][s] := "Tabs"
GetIndentationType[s_String] := "Whitespace"


ParseTable[{header_String,alignment_String, rows__String}] := MarkdownElement[
	"Table",
	<|
	"Headers" -> Map[iTokenizeMarkdownString][StringSplit[header, "|"]],
	"Alignment" -> Map[StringTrim /* ParseTableAlignment][StringSplit[alignment, "|"]],
	"Rows" -> Map[Map[iTokenizeMarkdownString][StringSplit[#, "|"]]&][{rows}]
	|>
]

ParseTableAlignment[s_String] /; StringMatchQ[(":" ~~ "-" .. ~~ ":") | ("-" ..)][s] := Center
ParseTableAlignment[s_String] /; StringMatchQ[":" ~~ "-" ..][s] := Left
ParseTableAlignment[s_String] /; StringMatchQ["-" .. ~~ ":"][s] := Right

(* \[LongDash] Patterns *)
$MarkdownHeading = RuleDelayed[
	RegularExpression["^(\\#{1,6}\\s)(.*)"],
	MarkdownElement["H"<> ((StringCount[#, "#"]&) /* ToString@"$1"), iTokenizeMarkdownString["$2"]]
	]

$MarkdownBold1 = RuleDelayed[
	RegularExpression["(?<!_)((__)(([^\\s_].+?[^\\s_])|(.))\\g2)(?!_)"],
	MarkdownElement[Bold, iTokenizeMarkdownString["$3"]]
	]

$MarkdownBold2 = RuleDelayed[
	RegularExpression["(?<![*])((\\*\\*)(([^\\s*].+?[^\\s*])|(.))\\g2)(?![*])"],
	MarkdownElement[Bold, iTokenizeMarkdownString["$3"]]
	]

$MarkdownItalic1 = RuleDelayed[
	RegularExpression["(?<!_)((_)(([^\\s_].+?[^\\s_])|(.))\\g2)(?!_)"],
	MarkdownElement[Italic, iTokenizeMarkdownString["$3"]]
	]

$MarkdownItalic2 = RuleDelayed[
	RegularExpression["(?<![*])((\\*)(([^\\s*].+?[^\\s*])|(.))\\g2)(?![*])"],
	MarkdownElement[Italic, iTokenizeMarkdownString["$3"]]
	]

$MarkdownInlineCode = RuleDelayed[
	RegularExpression["(`)([^`\n]+?)\\g1"],
	MarkdownElement["InlineCode","$2"]
]

$MarkdownTeX1 = RuleDelayed[
	RegularExpression["(\\$\\$)(.*)\\g1"],
	MarkdownElement["LaTeX",<|"Type"-> "Display","Body"->"$2"|>]
	]

$MarkdownTeX2 = RuleDelayed[
	RegularExpression["(\\\\\[)(\\s?)(.*)\\g2(\\\\\])"],
	MarkdownElement["LaTeX",<|"Type"-> "Display","Body"->"$3"|>]
	]

$MarkdownTeX3 = RuleDelayed[
	RegularExpression["(\\$)(.*?)\\g1"],
	MarkdownElement["LaTeX",<|"Type"-> "Inline","Body"->"$2"|>]
	]

$MarkdownTeX4 = RuleDelayed[
	RegularExpression["^\\\\\\(\\s?(.+?)\\s?\\\\\\)$"],
	MarkdownElement["LaTeX", <|"Type"-> "Inline","Body"->"$1"|>]
	]

$MarkdownLink1 = RuleDelayed[
	RegularExpression["(?ms)(?:\\A|\\s)\\[(.+?)\\]\\((\\S.+?)\\)(?:\\z|\\s)"],
	MarkdownElement[Hyperlink,<|"Label"->iTokenizeMarkdownString["$1"],"URL"->"$2"|>]
	]

$MarkdownLink2 = RuleDelayed[
	RegularExpression["(?ms)<(.+)>"],
	MarkdownElement[Hyperlink,<|"URL"-> "$1"|>]
	]

$MarkdownLink3 = RuleDelayed[
	RegularExpression["\\!\\[(.*)\\]\\((.*)\\)"],
	MarkdownElement[Hyperlink,<|"AltText"-> "$1","URL"-> "$2"|>]
	]

$MarkdownFootnoteReference = RuleDelayed[
	RegularExpression["(?ms)(?:\\A|^|\\s)\\[(.+?)\\]\\[(\\d+?)\\]"],
	MarkdownElement["FootnoteReference", iTokenizeMarkdownString["$1"], ToExpression["$2"]]
	]

$MarkdownFootnote = RuleDelayed[
	RegularExpression["(^|\\n)\\s*\\[(\\d+)\\]:\\s?(.+)(\\n|$)"],
	MarkdownElement["Footnote", <|"Reference" -> ToExpression["$2"], "URL" -> "$3"|>]
	]

$MarkdownOrderedListItem = RuleDelayed[
	RegularExpression["(?ms)(?:\\A|^)(\\s*|\\t*)((\\d+\\.)(\\d+\\.?)*)+ (.*)"],
	With[
		{type = GetIndentationType["$1"]},
		MarkdownElement["Item", <|"Type" -> "Ordered", "IndentationLevel" -> GetIndentationLevel["$1", type],"IndentationType" -> type, "Text" -> iTokenizeMarkdownString["$3"]|> ]
		]
	]

$MarkdownUnorderedListItem = RuleDelayed[
	RegularExpression["(?:^|\\A)(\\s*|\\t*)[\\*\\-\\+] (.*)$"],
	With[
			{type = GetIndentationType["$1"]},
			MarkdownElement["Item", <|"Type" -> "Unordered", "IndentationLevel" -> GetIndentationLevel["$1", type],"IndentationType" -> type, "Text" -> iTokenizeMarkdownString["$2"]|> ]
			]
	]

$MarkdownBlockQuote = RuleDelayed[
	RegularExpression["(?ms)>\\s?(.+)\\z"],
	MarkdownElement["BlockQuote", iTokenizeMarkdownString["$1"]]
	]

$MarkdownTable = RuleDelayed[
	RegularExpression["(?ms)^(\\|?\\s?(.+\\|.+)+)$"],
	ParseTable[StringSplit["$0", "\n"]]
	]

$MarkdownCodeBlock1 = RuleDelayed[
	RegularExpression["(?ms)^(\\`{3})(\\w+)$((.|\n)+)^\\g1$"],
	MarkdownElement["CodeBlock",<|"Language"-> "$2","Body"-> "$3"|>]
	]

$MarkdownCodeBlock2 = RuleDelayed[
	RegularExpression["(?ms)(\\`{3})\n([^\\`]+?)\n\\g1"],
	MarkdownElement["CodeBlock",<|"Language"-> "None","Body"-> "$2"|>]
	]

$MarkdownCodeBlock3 = RuleDelayed[
	RegularExpression["(?ms)(?:\\A|^)([ ]{4}|\t)(.+)"],
	MarkdownElement["CodeBlock",<|"Language"-> "None","Body"-> "$0"|>]
	]

$MarkdownHorizontalLine = RuleDelayed[
	RegularExpression["(?ms)(?:\\A|^)(---|(\\*\\*\\*)|___)\\s*\\z"],
	MarkdownElement["HorizontalLine"]
	]

(* \[LongDash] Parsing *)

iTokenizeMarkdownBlock[expr_] := StringSplit[
		expr,
		{
			$MarkdownTable,
			$MarkdownCodeBlock1,
			$MarkdownCodeBlock2,
			$MarkdownCodeBlock3
		}
	]

iTokenizeMarkdownString[expr_] := StringSplit[
		expr,
		{
			$MarkdownOrderedListItem,
			$MarkdownUnorderedListItem,
			$MarkdownHeading,
			$MarkdownItalic1,
			$MarkdownItalic2,
			$MarkdownBold1,
			$MarkdownBold2,
			$MarkdownInlineCode,
			$MarkdownTeX1,
			$MarkdownTeX2,
			$MarkdownTeX3,
			$MarkdownTeX4,
			$MarkdownBlockQuote,
			$MarkdownHorizontalLine,
			$MarkdownLink1,
			$MarkdownLink2,
			$MarkdownLink3,
			$MarkdownFootnoteReference,
			$MarkdownFootnote
		}
	]

TokenizeMarkdownString[s_String] := iTokenizeMarkdownString[s]
TokenizeMarkdownBlock[s_String] := iTokenizeMarkdownBlock[s]

MarkdownParse[file_File?FileExistsQ] := MarkdownParser[file]

MarkdownParser[source_File] := Module[
	{
		data = Import[source, "Text"],
		tblocks, tlines
		},
	(* 1 — Tokenize Tables and Codeblocks *)
	tblocks = TokenizeBlock[data];
	(* 2 — Tokenize the rest *)
	tlines = TokenizeLine[tblocks];
	(* 3 — Convert lists to Markdown Line elements *)
	PostTokenize[tlines]
	]

End[] (* End `Private` *)

EndPackage[]
