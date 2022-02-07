(* ::Package:: *)

BeginPackage["WLMarkdown`"]

(* Declare your package's public symbols here. *)

MarkdownParse::usage = "MarkdownParse[file.md] parses file.md into symbolic markdown"
MarkdownElement::usage = "Represents an element in Symbolic Markdown"

ParseMarkdownString::usage = "ParseMarkdownString[s] parses s into its MarkdownElement constituents"

Begin["`Private`"]

(* Import *)

GetMDLines[source_] := With[{data = Import[source, "Text"]}, StringSplit[data,"\n"]];

(* Parser *)

(* \[LongDash] Utilities *)
Options[GetIndentationLevel] = {
	"IndentLength" -> 2
};

GetIndentationLevel["", _] := 0
GetIndentationLevel[lead_String, "Tabs", OptionsPattern[]] := StringLength[lead]
GetIndentationLevel[lead_String, "Whitespace", OptionsPattern[]] := StringLength[lead]/OptionValue["IndentLength"]

GetIndentationType[""] := None
GetIndentationType[s_String] /;StringMatchQ[RegularExpression["^\\t+"]][s] := "Tabs"
GetIndentationType[s_String] := "Whitespace"

ParseTableAlignment[s_String] /; StringMatchQ[(":" ~~ "-" .. ~~ ":") | ("-" ..)][s] := Center
ParseTableAlignment[s_String] /; StringMatchQ[":" ~~ "-" ..][s] := Left
ParseTableAlignment[s_String] /; StringMatchQ["-" .. ~~ ":"][s] := Right

(* \[LongDash] Patterns *)
$MarkdownHeading = RuleDelayed[
	RegularExpression["^(\\#{1,6}\\s)(.*)"],
	MarkdownElement["H"<> ((StringCount[#, "#"]&) /* ToString@"$1"), parseMD["$2"]]
	]

$MarkdownBold = RuleDelayed[
	RegularExpression["(?<![_*])((__|\\*\\*)(([^\\s_*].+?[^\\s_*])|(.))\\g2)(?![_*])"],
	MarkdownElement[Bold, parseMD["$3"]]
	]

$MarkdownItalic = RuleDelayed[
	RegularExpression["(?<![_*])((_|\\*)(([^\\s_*].+?[^\\s_*])|(.))\\g2)(?![_*])"],
	MarkdownElement[Italic, parseMD["$3"]]
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

$MarkdownTeX5 = RuleDelayed[
	RegularExpression["(\\\\\()(\\s?)(.*?)\\g2(\\\\\))"],
	MarkdownElement["LaTeX", <|"Type"-> "Inline","Body"->"$3"|>]
	]

$MarkdownLink1 = RuleDelayed[
	RegularExpression["(?ms)(?:\\A|\\s)\\[(.+?)\\]\\((\\S.+?)\\)(?:\\z|\\s)"],
	MarkdownElement[Hyperlink,<|"Label"->parseMD["$1"],"URL"->"$2"|>]
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
	MarkdownElement["FootnoteReference", parseMD["$1"], ToExpression["$2"]]
	]

$MarkdownFootnote = RuleDelayed[
	RegularExpression["(^|\\n)\\s*\[(\\d+)\]:\\s?(.+)(\\n|$)"],
	MarkdownElement["Footnote", <|"Reference" -> ToExpression["$2"], "URL" -> "$3"|>]
	]

$MarkdownOrderedListItem = RuleDelayed[
	RegularExpression["(?:\\A|^)(\\s*|\\t*)(\\d\\.)+ (.*)"],
	With[
		{type = GetIndentationType["$1"]},
		MarkdownElement["Item", <|"Type" -> "Ordered", "IndentationLevel" -> GetIndentationLevel["$1", type],"IndentationType" -> type, "Text" -> parseMD["$3"]|> ]
		]
	]

$MarkdownUnorderedListItem = RuleDelayed[
	RegularExpression["(?:^|\\A)(\\s*|\\t*)[\\*\\-\\+] (.*)$"],
	With[
			{type = GetIndentationType["$1"]},
			MarkdownElement["Item", <|"Type" -> "Unordered", "IndentationLevel" -> GetIndentationLevel["$1", type],"IndentationType" -> type, "Text" -> parseMD["$2"]|> ]
			]
	]

$MarkdownBlockQuote = RuleDelayed[
	RegularExpression["(?ms)>\\s?(.+)\\z"],
	MarkdownElement["BlockQuote", parseMD["$1"]]
	]

$MarkdownTableAlignment = RuleDelayed[
	RegularExpression["\\|?\\s?((:?)(-{3,})(:?)\\s?\\|?\\s?)+"],
	MarkdownElement["TableAlignment", Map[StringTrim /* ParseTableAlignment]@StringSplit["$0", "|"]]
	]

$MarkdownTableData = RuleDelayed[
	RegularExpression["^\\|?\\s?(.+\\|.+)+$"],
	MarkdownElement["TableData", Map[StringTrim /* parseMD]@StringSplit["$0", "|"]]
	]


$MarkdownCodeBlock1 = RuleDelayed[
	RegularExpression["(\\`{3})(\\w+)\n([^\\`]+?)\n\\g1"],
	MarkdownElement["CodeBlock",<|"Language"-> "$2","Body"-> "$3"|>]
	]

$MarkdownCodeBlock2 = RuleDelayed[
	RegularExpression["(\\`{3})\n([^\\`]+?)\n\\g1"],
	MarkdownElement["CodeBlock",<|"Language"-> "None","Body"-> "$2"|>]
	]

$MarkdownCodeBlock3 = RuleDelayed[
	RegularExpression["(?ms)(?:\\A|^)(?:[ ]{4}|\t)(.+)"],
	MarkdownElement["CodeBlock",<|"Language"-> "None","Body"-> "$1"|>]
	]

$MarkdownHorizontalLine = RuleDelayed[
	RegularExpression["(?ms)(?:\\A|^)(---|(\\*\\*\\*))\\s*\\z"],
	MarkdownElement["HorizontalLine"]
	]

(* \[LongDash] Parsing *)
ParseMDLines[lines_List] := MapIndexed[ParseMDLine[#1, #2]&, lines];
ParseMDLine[line_String, {lnum_Integer}] := MarkdownElement["Line", lnum, parseMD[line]]

parseMD[expr_] := 	StringSplit[
		expr,
		{
			$MarkdownHeading,
			$MarkdownTableAlignment,
			$MarkdownTableData,
			$MarkdownItalic,
			$MarkdownBold,
			$MarkdownInlineCode,
			$MarkdownTeX1,
			$MarkdownTeX2,
			$MarkdownTeX3,
			$MarkdownTeX4,
			$MarkdownTeX5,
			$MarkdownOrderedListItem,
			$MarkdownUnorderedListItem,
			$MarkdownBlockQuote,
			$MarkdownCodeBlock1,
			$MarkdownCodeBlock2,
			$MarkdownCodeBlock3,
			$MarkdownHorizontalLine,
			$MarkdownLink1,
			$MarkdownLink2,
			$MarkdownLink3,
			$MarkdownFootnoteReference,
			$MarkdownFootnote
		}
	]

ParseMarkdownString[s_String] := parseMD[s]

MarkdownParse[file_File?FileExistsQ] := MarkdownParser[file]

MarkdownParser[source_File] := Module[
	{lines = GetMDLines[source]},
	ParseMDLines[lines]
	]

End[] (* End `Private` *)

EndPackage[]
