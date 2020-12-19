(* ::Package:: *)

(* ::Title:: *)
(*Markdown Parser Tests*)


(* ::Abstract:: *)
(*Test the MarkdownParser on snippets of Text*)


(* ::Chapter:: *)
(*Begin Package*)


BeginPackage["MarkdownParserTests`"]
Needs["MarkdownParse`"];
(* \[DownArrow] Allow Refresh of Definitions on Get call \[DownArrow] *)
Unprotect["MarkdownParserTests`*"];
ClearAll["MarkdownParserTests`*"];
ClearAll["MarkdownParserTests`Private`*"];
(* \[UpArrow] Can be removed in Production             \[UpArrow] *)
TestParser::usage="TestParser[\*StyleBox[\"input\",\"TI\"]] Applies MarkdownParser to input and returns the result as an Association\nTestParser[\*StyleBox[\"component,input\",\"TI\"]] Applies MarkdownParser to input and returns the result as an Association with the Component label \*StyleBox[\"component\",\"TI\"]"
Begin["Private`"]


TestParser["Generic",inputData_]:=Module[
{parse=FixedPoint[MarkdownParser,inputData]},
<|"InputString"-> inputData,"Parse"-> parse|>
]
TestParser[inputString_String]/;\[Not](StringMatchQ["Table"|"CodeBlock"|"Footnotes"|"Report"|"Generic"][inputString]):=Module[
{input=inputString, parse=FixedPoint[MarkdownParser,inputString]},
<|"InputString"-> input,"Parse"-> parse|>
]
TestParser[component_String,inputString_String]/;\[Not](StringMatchQ["Generic"][component]):=Module[
{input=inputString, parse=TestParser[inputString]},
<|"Component"-> component|>~Join~parse
]
TestParser[component_String,inputs_List]/;\[Not](StringMatchQ["Generic"][component]):=(TestParser[component,#]&/@inputs)

TestParser["Table"]:=Module[
{
table="Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3"
},
<|"Component"-> "Table","Input"-> table,"Parse"-> MarkdownTableParse[table]|>
]

TestParser["CodeBlock"]:=Module[
{
codeblock1="
```Mathematica
f[x]:=2;
f[y]:=3
```
",
codeblock2="
```
f[x]:=2;
f[y]:=3
```
",
codeblock3="
    A generic codeblock
"
},
TestParser["CodeBlock",{codeblock1,codeblock2,codeblock3}]
]

TestParser["Footnotes"]:=Module[
{
testString="
[A footnote][1]\n[Another footnote][2]\n

[1]:www.google.com
[2]:www.wolfram.com
",
footnoteResult
},
footnoteResult=TestParser@testString;
<|"Component"-> "Footnotes","Input"-> testString,"Parse"-> footnoteResult["Parse"]|>
]

TestParser["Report"]:=Module[
	{headings,emphasis,table,codeblock,footnotes},
	headings=EchoEvaluation@TestParser["Headings",
	{"# A Title","## A Subtitle","### A Chapter","#### A Section","##### A Subsection","###### A Subsubsection","####### A Paragraph"}
	];
	emphasis=EchoEvaluation@TestParser["Emphasis",{"_test_","this is a _test_","a _different kind_ of test","a _slightly_ **different** _kind_ of test","a _**mixed bag**_ test","> a _block quote_ test"}];
	table=EchoEvaluation@TestParser["Table"];
	codeblock=EchoEvaluation@TestParser["CodeBlock"];
	footnotes=EchoEvaluation@TestParser["Footnotes"];
	Column@(Dataset/@{headings,emphasis,table,codeblock,footnotes})
]


(* ::Chapter::Closed:: *)
(*End Package*)


End[]
Protect["MarkdownParserTests`*"];
EndPackage[]
