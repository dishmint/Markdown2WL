(* ::Package:: *)

(* ::Title:: *)
(*Markdown Parse*)


(* ::Abstract:: *)
(*Parses basic flavors of Markdown into MarkdownElements*)


(* ::Subtitle:: *)
(*Begin Package*)


BeginPackage["MarkdownParse`"]
(* \[DownArrow] Allow Refresh of Definitions on Get call \[DownArrow] *)
Unprotect["MarkdownParse`*"];
ClearAll["MarkdownParse`*"];
ClearAll["MarkdownParse`Private`*"];
(* \[UpArrow] Can be removed in Production             \[UpArrow] *)
MarkdownParse::usage="MarkdownParse[\*StyleBox[\"file . md\",\"TI\"]] Reads in markdown \*StyleBox[\"file . md\",\"TI\"], and parses to a list of nested MarkdownElements and text"
MarkdownParseGrid::usage="MarkdownParseGrid[\*StyleBox[\"example\",\"TI\"]] returns a grid pairing the input string (or list of input strings), \*StyleBox[\"example\",\"TI\"], with its parse (or parses)"
MarkdownElement::usage="Symbolic Representation of Markdown tags"
Begin["Private`"]


(* ::Chapter:: *)
(*Support Functions*)


(* ::Section:: *)
(*Primitives*)


(* ::Abstract:: *)
(*Primitive Rules used in top-level Markdown parser*)


(* ::Subsection::Closed:: *)
(*Headings*)


markdownParseHeadings=(StartOfString~~headingSpec:("#"..~~WhitespaceCharacter)~~line__):>MarkdownElement["H"<>((Clip[StringLength[#],{1,7}]-1&)/*ToString@headingSpec),MarkdownParser[line]];


(* ::Subsection:: *)
(*Bold*)


markdownParseBold=(StartOfLine|StartOfString|WhitespaceCharacter|Except["*", PunctuationCharacter])~~"**"~~inner:Shortest[(Except[WhitespaceCharacter]~~__)]~~"**"~~(EndOfLine|EndOfString|WhitespaceCharacter|Except["*", PunctuationCharacter]):>
MarkdownElement[Bold,MarkdownParser[inner]];


(* ::Subsection:: *)
(*Italic*)


markdownParseItalic=(StartOfString|WhitespaceCharacter|Except["*", PunctuationCharacter])~~("*"|"_")~~inner:Shortest[(Except[WhitespaceCharacter])~~__]~~("*"|"_")~~(EndOfString|WhitespaceCharacter|Except["*", PunctuationCharacter]):> MarkdownElement[Italic,MarkdownParser[{inner}]];


(* ::Subsection::Closed:: *)
(*Link/Footnote*)


markdownParseLink=(StartOfString|WhitespaceCharacter)~~"["~~linkname:Shortest[__]~~"]("~~url:Shortest[(Except[WhitespaceCharacter]~~__)]~~")"~~(EndOfString|WhitespaceCharacter):> MarkdownElement[Hyperlink,MarkdownParser[linkname],url];
markdownParseLink2=("<"~~url__~~">"):>MarkdownElement[Hyperlink,url];


markdownParseFootnote=((StartOfString|StartOfLine|WhitespaceCharacter)~~Shortest["["~~label__~~"]["~~ref:(DigitCharacter..)~~"]"]):> MarkdownElement[Hyperlink,MarkdownParser[label],MarkdownParser[MarkdownElement["FootnoteReference",{ToExpression[ref]}]]];


(* ::Subsection::Closed:: *)
(*OrderedItem*)


markdownOrderedListItem=((n:(DigitCharacter..)~~".")~~WhitespaceCharacter~~stuff__~~EndOfString):>MarkdownElement["ItemNumbered",{ToExpression[n]},MarkdownParser[stuff]];


(* ::Subsection::Closed:: *)
(*UnOrderedItem*)


markdownUnOrderedListItem=(n:("*"|"+"|"-")~~WhitespaceCharacter~~stuff__~~EndOfString):>MarkdownElement["Item",MarkdownParser[stuff]];


(* ::Subsection::Closed:: *)
(*BlockQuote*)


markdownBlockquote=(">"~~(WhitespaceCharacter|"")~~stuff__~~EndOfString):>MarkdownElement["Blockquote",MarkdownParser[stuff]];


(* ::Subsection::Closed:: *)
(*$MarkdownPrimitives*)


$MarkdownPrimitives={
markdownParseHeadings,markdownParseBold,markdownParseItalic,
markdownParseLink,markdownParseLink2,markdownParseFootnote,
markdownBlockquote,
markdownOrderedListItem,markdownUnOrderedListItem
};


(* ::Section:: *)
(*Utilities*)


(* ::Abstract:: *)
(*Generate "footfile", a string where all lines are footnote references of the form [ref_number]:url , from the main markdown file to be used as the second argument to ExtractMarkdownFootnoteURL*)


ExtractAllMarkdownFootnotes[file_String]:=Module[
{readlist=ReadList[file,String],footnotes},
footnotes=(StringCases[RegularExpression["(^|\\n)\\s*(\\[\\d+\\]\\:.*)(\\n|$)"]:>"$2"][readlist]/.{}->Nothing);
Flatten/*(StringRiffle[#,"\n"]&)/*StringJoin@footnotes
]


(* ::Abstract:: *)
(*Extract Markdown footnote URL from "footfile" using the reference number ref*)


ExtractMarkdownFootnoteURL[ref_,footfile_]:=StringCases[footfile,RegularExpression["(^|\\n)\\s*\\["<>ToString[ref]<>"\\]\\:(.*)(\\n|$)"]:>"$2"]


(* ::Abstract:: *)
(*Example Strings used for testing*)


{s1,s2,s3,s4,s5,s6,s7,s8,ff}={
"**this** is a line with some **bold _text_**",
"trying out a [hyperlink](www.google.com)",
"This [_hyperlink_](www.google.com) is styled",
"# a title with _some_ **styling**",
"1. an Ordered list item",
"* This is an _unordered_ item",
"> This is an *blockquote*",
"[A footnote][1]",
" [1]:www.google.com"
};


(* ::Abstract:: *)
(*MarkdownParseGrid returns a grid of the parsed results for each string*)


MarkdownParseGrid[s_String]:=MarkdownParseGrid[{s}]
MarkdownParseGrid[sl:List[__String]]:=Module[
	{count=1},
	Grid[
	{{"","Text","Markdown"}}~Join~({"s"<>ToString[count++],#,MarkdownParser[#]}&/@sl),
	Alignment->Left,Frame->All,ItemStyle->{{Blue,{"Text"},{"Code"}},{1->"Text"}}]

]


(* ::Section::Closed:: *)
(*MarkdownParser*)


(* ::Subsection::Closed:: *)
(*Level 1*)


MarkdownParser[s_String]:=Module[
{result},
(* Split String s and replace splitpoint via $MarkdownPrimitives *)
result=StringSplit[
s,
{
Sequence@@$MarkdownPrimitives
}
];
(* Parse result which might have more strings, or MarkdownElements to be parsed *)
result=MarkdownParser[result];
result
]


(* ::Subsection::Closed:: *)
(*DeepLevel*)


MarkdownParser[List[s_String]]:=s
MarkdownParser[{m_MarkdownElement}]:=MarkdownParser[m]
MarkdownParser[{a_String,m_MarkdownElement,c_String}]:={MarkdownParser[a],m,MarkdownParser[c]}
MarkdownParser[{a__,m_MarkdownElement,c__}]:={MarkdownParser[a],m,MarkdownParser[c]}
MarkdownParser[MarkdownElement[t_,d_List]]:=MarkdownElement[t,MarkdownParser[d]]
MarkdownParser[MarkdownElement[t_,d_String]]:=MarkdownElement[t,MarkdownParser[d]]
MarkdownParser[l_List]:=l
MarkdownParser[l_List]/;AllTrue[StringQ][l]:=(StringRiffle/*StringJoin@l)
MarkdownParser[l_List]:=l
MarkdownParser[m_MarkdownElement]:=m
MarkdownParser[s__]:=Sequence[s]


(* ::Section::Closed:: *)
(*MarkdownParse*)


MarkdownParse[file_String]:=Block[
	{
	footFile=ExtractAllMarkdownFootnotes[file],
	$footnote=RegularExpression["(^|\\n)\\s*(\\[\\d+\\]\\:.*)(\\n|$)"],
	lines=ReadString/*(StringSplit[#,"\n"]&)@file,
	parsedLines,footnoteCheck,parsed
	},
	parsedLines=(MarkdownParser/@lines);
	footnoteCheck=(parsedLines/.MarkdownElement["FootnoteReference",{ref_}]:>First@ExtractMarkdownFootnoteURL[ref,footFile]);
	parsed=If[StringQ[#]\[And]StringMatchQ[$footnote][#],StringReplace[$footnote-> "(wasfootnote)"][#],#]&/@footnoteCheck;
	DeleteCases["(wasfootnote)"][parsed]
	(* TODO:
	parsed=MarkdownObject[{footnoteCheck}];
	*)
]


(* ::Subtitle:: *)
(*End Package*)


End[]
Protect["MarkdownParse`*"];
EndPackage[]
