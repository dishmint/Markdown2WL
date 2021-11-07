(* ::Package:: *)

(* ::Title:: *)
(*Markdown Parser Tests*)


(* ::Abstract:: *)
(*Test the MarkdownParser on snippets of Text*)


(* ::Chapter:: *)
(*Begin Package*)


BeginPackage["MarkdownParserTests`"]
Unprotect["MarkdownParserTests`*"];
ClearAll["MarkdownParserTests`*"];
ClearAll["MarkdownParserTests`Private`*"];
Needs["MarkdownParse`"];
MarkdownParserTestReport::usage="Runs a suite of verification tests"
$MarkdownParserVerificationTests::usage="A list of Verifcation Tests"
Begin["Private`"]


(* ::Section:: *)
(*VerificationTests*)


$MarkdownParserVerificationTests=(
{
	(* HEADINGS *)
	VerificationTest[FixedPoint[MarkdownParser,"# A Title"],MarkdownElement["H1","A Title"],TestID->"H1Test"],
	VerificationTest[FixedPoint[MarkdownParser,"## A Subtitle"],MarkdownElement["H2","A Subtitle"],TestID->"H2Test"],
	VerificationTest[FixedPoint[MarkdownParser,"### A Chapter"],MarkdownElement["H3","A Chapter"],TestID->"H3Test"],
	VerificationTest[FixedPoint[MarkdownParser,"#### A Section"],MarkdownElement["H4","A Section"],TestID->"H4Test"],
	VerificationTest[FixedPoint[MarkdownParser,"##### A Subsection"],MarkdownElement["H5","A Subsection"],TestID->"H5Test"],
	VerificationTest[FixedPoint[MarkdownParser,"###### A Subsubsection"],MarkdownElement["H6","A Subsubsection"],TestID->"H6Test"],
	VerificationTest[FixedPoint[MarkdownParser,"####### A Paragraph"],"####### A Paragraph",TestID->"HNTest"],
	
	(* EMPHASIS *)
	VerificationTest[FixedPoint[MarkdownParser,"_test_"],MarkdownElement[Italic,"test"],TestID->"ItalicTest1"],
	VerificationTest[FixedPoint[MarkdownParser,"this is a _test_"],{"this is a ",MarkdownElement[Italic,"test"]},TestID->"ItalicTest2"],
	VerificationTest[FixedPoint[MarkdownParser,"a _different kind_ of test"],{"a ",MarkdownElement[Italic,"different kind"]," of test"},TestID->"ItalicTest3"],
	VerificationTest[FixedPoint[MarkdownParser,"a _slightly_ **different** _kind_ of test"],{"a ",MarkdownElement[Italic,"slightly"]," ",MarkdownElement[Bold,"different"]," ",MarkdownElement[Italic,"kind"]," of test"},TestID->"ItalicTest4"],
	VerificationTest[FixedPoint[MarkdownParser,"a _**mixed bag**_ test"],{"a ",MarkdownElement[Italic,MarkdownElement[Bold,"mixed bag"]]," test"},TestID->"ItalicTest5"],
	VerificationTest[FixedPoint[MarkdownParser,"> a _block quote_ test"],MarkdownElement["BlockQuote",{"a ",MarkdownElement[Italic,"block quote"], " test"}],TestID->"BlockQuoteTest1"],
	
	(* TABLE *)
	VerificationTest[MarkdownTableParse["Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3"],{MarkdownElement["Table",{MarkdownElement["TableHeader",{"Markdown "," Less "," Pretty"}],MarkdownElement["TableAlignment",{{Center},{Center},{Center}}],{MarkdownElement["TableRow",{{MarkdownElement[Italic,"Still"]," "},{" ",MarkdownElement["InlineCode","renders"]," "},{" ",MarkdownElement[Bold,"nicely"]}}],MarkdownElement["TableRow",{"1 "," 2 "," 3"}]}}]},TestID->"TableTest1"],
	
	(* CODEBLOCK *)
	VerificationTest[FixedPoint[MarkdownParser,"
```Mathematica
f[x]:=2;
f[y]:=3
```
"],{"\n",MarkdownElement["CodeBlock", <|"Language" -> "Mathematica","Body" -> "f[x]:=2;
f[y]:=3"|>],"\n"},TestID->"CodeBlockTest1"],
	VerificationTest[FixedPoint[MarkdownParser,"
```
f[x]:=2;
f[y]:=3
```
"],{"\n",MarkdownElement["CodeBlock", <|"Language" -> "None","Body" -> "f[x]:=2;
f[y]:=3"|>],"\n"},TestID->"CodeBlockTest2"],
	VerificationTest[FixedPoint[MarkdownParser,"
    A generic code block
    With some text
"],{"\n",MarkdownElement["CodeBlock", <|"Language" -> "None","Body" -> "A generic code block
    With some text
"|>]},TestID->"CodeBlockTest3"],

	(* INLINE CODE *)
	VerificationTest[
		FixedPoint[MarkdownParser,"`inline code`"],
		MarkdownElement["InlineCode","inline code"],
		TestID->"InlineCodeTest1"
	],
	VerificationTest[
		FixedPoint[MarkdownParser,"insert inline `code block` formatting anywhere"],
		{"insert inline ",MarkdownElement["InlineCode","code block"], " formatting anywhere"},
		TestID->"InlineCodeTest2"
	],
	VerificationTest[
		FixedPoint[MarkdownParser,"### A Chapter heading with `inline code` inserted"],
		MarkdownElement["H3",{"A Chapter heading with ",MarkdownElement["InlineCode","inline code"]," inserted"}],
		TestID->"InlineCodeTest3"
	],
	(* LaTeX *)
	VerificationTest[
		FixedPoint[MarkdownParser,"\(a^2 + b^2 = c^2\)"],
		MarkdownElement["LaTeX",<|"Type"->"Inline","Body"->"a^2 + b^2 = c^2"|>],
		TestID -> "InlineLaTeXTest1"
		],
	VerificationTest[
		FixedPoint[MarkdownParser,"$ a^2 + b^2 = c^2 $"],
		MarkdownElement["LaTeX",<|"Type"->"Inline","Body"->" a^2 + b^2 = c^2 "|>],
		TestID -> "InlineLaTeXTest2"
		],
	VerificationTest[
		FixedPoint[MarkdownParser,"\[ a^n + b^n = c^n \]"],
		MarkdownElement["LaTeX",<|"Type"->"Display","Body"->"a^n + b^n = c^n"|>],
		TestID -> "DisplayLaTeXTest1"
		],
	VerificationTest[
		FixedPoint[MarkdownParser,"$$ a^2 + b^2 = c^2 $$"],
		MarkdownElement["LaTeX",<|"Type"->"Display","Body"->" a^2 + b^2 = c^2 "|>],
		TestID -> "DisplayLaTeXTest2"
		],
	(* LINKS *)
	VerificationTest[
		FixedPoint[MarkdownParser,"[click here](www.google.com)"],
		MarkdownElement[Hyperlink,<|"Label"-> "click here","Link"-> "www.google.com"|>],
		TestID -> "LinkTest1"
		],
	VerificationTest[
		FixedPoint[MarkdownParser,"<www.google.com>"],
		MarkdownElement[Hyperlink,<|"Link"-> "www.google.com"|>],
		TestID -> "LinkTest2"
		],
	VerificationTest[
		FixedPoint[MarkdownParser,"![Streetview of Palm Trees by Brandon Erlinger-Ford](https://images.unsplash.com/photo-1564889998041-0dacc0706a0f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=564&q=80)"],
		MarkdownElement[Hyperlink,<|"AltText"->"Streetview of Palm Trees by Brandon Erlinger-Ford","Link"->"https://images.unsplash.com/photo-1564889998041-0dacc0706a0f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=564&q=80"|>],
		TestID -> "ImageLinkTest1"
		],
	(* FOOTNOTES *)
	VerificationTest[
		FixedPoint[MarkdownParser,"[The first footnote][1] was there and here's [the second footnote][2]"],
		{MarkdownElement[Hyperlink,"The first footnote",MarkdownElement["FootnoteReference",{1}]]," was there and here's",MarkdownElement[Hyperlink,"the second footnote",MarkdownElement["FootnoteReference",{2}]]},
		TestID -> "FoonoteTest1"
		],
	(* LIST ITEMS *)
	VerificationTest[
		FixedPoint[MarkdownParser,"* This is an unordered item"],
		MarkdownElement["Item",<|"Type" -> "Unordered", "IndentationLevel" -> 0, "IndentationType" -> None, "Content" -> "This is an unordered item"|>],
		TestID -> "UnorderedItemTest1"
		],
	VerificationTest[
		FixedPoint[MarkdownParser,"  * here is an unordered sub item"],
		MarkdownElement["Item",<|"Type" -> "Unordered", "IndentationLevel" -> 1, "IndentationType" -> "Whitespace", "Content" -> "here is an unordered sub item"|>],
		TestID -> "UnorderedItemTest2"
		],
	VerificationTest[
		FixedPoint[MarkdownParser,"1. This is an ordered item"],
		MarkdownElement["Item", <|"Type" -> "Ordered", "IndentationLevel" -> 0, "IndentationType" -> None, "Content" -> "This is an ordered item"|>],
		TestID -> "OrderedItemTest1"
		],
	VerificationTest[
		FixedPoint[MarkdownParser,"  1. here is an ordered sub item"],
		MarkdownElement["Item", <|"Type" -> "Ordered", "IndentationLevel" -> 1, "IndentationType" -> "Whitespace", "Content" -> "here is an ordered sub item"|>],
		TestID -> "OrderedItemTest2"
		]
}
)


(* ::Section:: *)
(*Report*)


MarkdownParserTestReport:=TestReport[
	$MarkdownParserVerificationTests
]


(* ::Chapter:: *)
(*End Package*)


End[]
Protect["MarkdownParserTests`*"];
EndPackage[]
