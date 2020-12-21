(* ::Package:: *)

(* ::Title:: *)
(*Markdown Parse*)


(* ::Abstract:: *)
(*Parse a Markdown file into MarkdownElements (similar to XMLElement)*)


(* ::Chapter:: *)
(*Begin Package*)


BeginPackage["MarkdownParse`"]
(* \[DownArrow] Allow Refresh of Definitions on Get call \[DownArrow] *)
Unprotect["MarkdownParse`*"];
ClearAll["MarkdownParse`*"];
ClearAll["MarkdownParse`Private`*"];
(* \[UpArrow] Can be removed in Production             \[UpArrow] *)
MarkdownParse::usage="MarkdownParse[\*StyleBox[\"file . md\",\"TI\"]] Reads in markdown \*StyleBox[\"file . md\",\"TI\"], and parses to a list of nested MarkdownElements and text"
MarkdownElement::usage="Represents an element in Symbolic Markdown"
$sampleStrings::usage="A set of strings used for testing"
$MarkdownParsePrimitives::usage="A set of patterns for markdown primitives"
Begin["Private`"]


(* ::Chapter:: *)
(*Support Functions*)


(* ::Section:: *)
(*Tag Primitives*)


(* ::Abstract:: *)
(*Primitive Rules used in top-level Markdown Parser*)


(* ::Text:: *)
(*After numerous issues with patterns, I've made use of patterns found here: https://gist.github.com/jbroadway/2836900*)


(* ::Subsection::Closed:: *)
(*Primitive Definitions*)


(* ::Subsubsection::Closed:: *)
(*Headings*)


(* ::Text:: *)
(*Convert strings that start with a sequence of #'s to a heading MarkdownElement*)


mdpHeadings=RegularExpression["^(\\#{1,6}\\s)(.*)"]:> MarkdownElement["H"<>((Clip[StringLength[#],{1,7}]-1&)/*ToString@"$1"),MarkdownParser["$2"]]


(* ::Subsubsection::Closed:: *)
(*Bold*)


mdpBold=RegularExpression["(\\*\\*|__)(.*?)\\g1"]:>MarkdownElement[Bold,MarkdownParser["$2"]];


(* ::Subsubsection::Closed:: *)
(*Italic*)


mdpItalic=RegularExpression["(\\*|\\_)(.*?)\\g1"]:> MarkdownElement[Italic,MarkdownParser["$2"]];


(* ::Subsubsection::Closed:: *)
(*Inline Code*)


(*mdpInlineCode=RegularExpression["(([^\`]|^|\\A|\\s)?=\\`{1})([^\`]*?)\\g1"]:> MarkdownElement["InlineCode","$1"];*)
mdpInlineCode=RegularExpression["(`)([^`\n]+?)\\g1"]:> MarkdownElement["InlineCode","$2"];


(* ::Subsubsection::Closed:: *)
(*LaTex*)


mdpTex1=RegularExpression["(\\$\\$)(.*)\\g1"]:> MarkdownElement["LaTex",<|"Type"-> "Display","Body"->"$2"|>];
mdpTex2=RegularExpression["(\\\\\[)(\\s?)(.*)\\g2(\\\\\])"]:> MarkdownElement["LaTex",<|"Type"-> "Display","Body"->"$3"|>];

mdpTex3=RegularExpression["(\\$)(.*?)\\g1"]:> MarkdownElement["LaTex",<|"Type"-> "Inline","Body"->"$2"|>];
mdpTex4=RegularExpression["(\\\()(\\s?)(.*?)\\g2(\\\))"]:> MarkdownElement["LaTex", <|"Type"-> "Inline","Body"->"$3"|>];
mdpTex5=RegularExpression["(\\\\\\()(\\s?)(.*?)\\g2(\\\\\\))"]:> MarkdownElement["LaTex", <|"Type"-> "Inline","Body"->"$3"|>];


(* ::Subsubsection::Closed:: *)
(*Link/Footnote*)


mdpLink=RegularExpression["(?ms)(?:\\A|\\s)\\[(.+?)\\]\\((\\S.+?)\\)(?:\\z|\\s)"]:> MarkdownElement[Hyperlink,<|"Label"->MarkdownParser["$1"],"Link"->"$2"|>];
mdpLink2=RegularExpression["(?ms)<(.+)>"]:>MarkdownElement[Hyperlink,<|"Link"-> "$1"|>];
mdpImageLink=RegularExpression["\\!\\[(.*)\\]\\((.*)\\)"]:>MarkdownElement[Hyperlink,<|"AltText"-> "$1","Link"-> "$2"|>];
mdpFootnote=RegularExpression["(?ms)(?:\\A|^|\\s)\\[(.+?)\\]\\[(\\d+?)\\]"]:>MarkdownElement[Hyperlink, MarkdownParser["$1"],MarkdownParser[MarkdownElement["FootnoteReference",{ToExpression["$2"]}]]];


(* ::Subsubsection::Closed:: *)
(*OrderedItem*)


mdpOrderedListItem=RegularExpression["(?ms)(?:\\A|^|\\s+)(\\d+)\\.\\s(.+)\\z"]:> MarkdownElement["ItemNumbered",{ToExpression["$1"]},MarkdownParser["$2"]]


(* ::Subsubsection::Closed:: *)
(*UnorderedItem*)


(* The + sign is causing problems for LaTex removing it for now (does that mean * could cause issues too?) *)
(*mdpUnorderedItem=RegularExpression["(?ms)(?:\\A|^|\\s+)([*+\\-])\\s(.+)\\z"]\[RuleDelayed]MarkdownElement["Item",MarkdownParser["$2"]];*)
mdpUnorderedItem=RegularExpression["(\n|^|\\A)(\t|\\s)*?(\\*|\\+|\\-])\\s(.+)\\z"]:>MarkdownElement["Item",MarkdownParser["$4"]];


(* ::Subsubsection::Closed:: *)
(*BlockQuote*)


mdpBlockQuote=RegularExpression["(?ms)>\\s?(.+)\\z"]:>MarkdownElement["BlockQuote",MarkdownParser["$1"]]


(* ::Subsubsection::Closed:: *)
(*Table*)


(* MarkdownElements for table data *)
MarkdownElement["Table",1,data_]:=MarkdownElement["TableHeader",data]
MarkdownElement["Table",2,data_]:=MarkdownElement["TableAlignment",data]
MarkdownElement["Table",_,data_]:=MarkdownElement["TableRow",data]


MarkdownTableParse[string_String]:=Module[{t=0},
	StringSplit[string,
	{
		RegularExpression["(?m)(^[^\\n]+\\|.+)"]:> (MarkdownElement["Table",++t,"$1"]),
		a:(Except["\n"]..):>(t=0;StringJoin[a])
	}
	]//SequenceReplace[{m_MarkdownElement,"\n"}:> m]//SequenceReplace[{mdth_MarkdownElement,mdta_MarkdownElement,mdtr__MarkdownElement}:> MarkdownElement[
	"Table",
		{
		StringSplit[mdth],
		StringSplit[mdta] ,
		(StringSplit/@{mdtr})}]]
]


(* ::Subsubsection::Closed:: *)
(*CodeBlocks*)


mdpCodeBlock=RegularExpression["(\\`{3})(\\w+)\n([^\\`]+?)\n\\g1"]:> MarkdownElement["CodeBlock",<|"Language"-> "$2","Body"-> "$3"|>]
mdpCodeBlock2=RegularExpression["(\\`{3})\n([^\\`]+?)\n\\g1"]:> MarkdownElement["CodeBlock",<|"Language"-> "None","Body"-> "$2"|>]
mdpCodeBlock3=RegularExpression["(?ms)(?:\\A|^)(?:[ ]{4}|\t)(.+)"]:> MarkdownElement["CodeBlock",<|"Language"-> "None","Body"-> "$1"|>]


(* ::Subsubsection::Closed:: *)
(*HorizontalLine*)


mdpHorizontalLine=RegularExpression["(?ms)(?:\\A|^)(---|(\\*\\*\\*))\\s*\\z"]:>MarkdownElement["HorizontalLine"]


(* ::Subsection::Closed:: *)
(*Primitive Collection*)


$MarkdownParsePrimitives={
mdpHeadings,mdpBold,mdpItalic,mdpTex1,mdpTex2,mdpTex3,mdpTex4,mdpTex5,mdpLink,mdpLink2,mdpImageLink,mdpFootnote,
mdpOrderedListItem,mdpUnorderedItem,mdpBlockQuote,mdpCodeBlock,mdpCodeBlock2,mdpCodeBlock3,mdpInlineCode,mdpHorizontalLine
}


(* ::Section::Closed:: *)
(*Utilities*)


(* ::Subsection::Closed:: *)
(*Footnotes*)


(* ::Subsubsection::Closed:: *)
(*Generate String of footnotes*)


(* ::Abstract:: *)
(*A string where all lines are footnote references of the form [ref_number]:url , from the main markdown file to be used as the second argument to ExtractMarkdownFootnoteURL*)


ExtractAllMarkdownFootnotes[file_String]:=Module[
{readlist=If[FileExistsQ[file],ReadList[file,String],StringSplit[file,"\n"]],footnotes},
footnotes=(StringCases[RegularExpression["(^|\\n)\\s*(\\[\\d+\\]\\:.*)(\\n|$)"]:>"$2"][readlist]/.{}->Nothing);
Flatten/*(StringRiffle[#,"\n"]&)/*StringJoin@footnotes
]


(* ::Subsubsection::Closed:: *)
(*Extract Footnote URLS*)


(* ::Abstract:: *)
(*Extract Markdown footnote URL from "footfile" using the reference number ref*)


ExtractMarkdownFootnoteURL[ref_,footfile_]:=StringCases[footfile,RegularExpression["(^|\\n)\\s*\\["<>ToString[ref]<>"\\]\\:(.*)(\\n|$)"]:>"$2"]


(* ::Subsection::Closed:: *)
(*Sample Strings for Testing*)


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
$sampleStrings={s1,s2,s3,s4,s5,s6,s7,s8,ff}


(* ::Subsection::Closed:: *)
(*MarkdownTableStringSplit*)


(* ::Abstract:: *)
(*Defines how MarkdownElements behave when StringSplit is applied on them*)


StringSplit[MarkdownElement[h_,s_String]]^:=Switch[h,
	"TableHeader",MarkdownElement[h,MarkdownParser/@StringSplit[s,"|"]],
	"TableAlignment",MarkdownElement[h,DeleteCases[" "|""][StringSplit[s,{
	"|"-> Nothing,
	RegularExpression["\\:(\\-)+"]-> {Left},
	RegularExpression["[^-]+(\\-)+\\:"]-> {Right},
	(RegularExpression["\\:(-)+\\:"]|RegularExpression["(-)+"])->{ Center},
	WordCharacter..-> {Center},
	":"-> Nothing
	}]]],
	"TableRow",MarkdownElement[h,MarkdownParser/@StringSplit[s,"|"]],
	_,MarkdownElement[h,MarkdownParser[s]]
]


(* ::Section::Closed:: *)
(*MarkdownParser*)


(* ::Subsection::Closed:: *)
(*Level 1*)


(* ::Abstract:: *)
(*MarkdownParser is applied to each line in the file*)


MarkdownParser[s_String]:=Module[
{result},
(* Split String s and replace splitpoint via $MarkdownPrimitives *)
result=StringSplit[s,$MarkdownParsePrimitives];
(* Parse the Result *)
result //= MarkdownParser;
result
]


(* ::Subsection::Closed:: *)
(*Level N*)


(* ::Abstract:: *)
(*These DownValues specify how MarkdownParser should behave when applied to particular structures*)


(* ::Subsubsection::Closed:: *)
(*Singeltons*)


(* Singletons *)
MarkdownParser[{}]:=Nothing
MarkdownParser[List[s_String]]:=s


(* ::Subsubsection::Closed:: *)
(*Lists*)


(* Lists *)
MarkdownParser[{m_MarkdownElement}]:=MarkdownParser[m]
MarkdownParser[{a_String,MarkdownElement[t_Symbol,s_String],c_String}]:={a,MarkdownElement[t,MarkdownParser[s]],c}
MarkdownParser[{a_String,m_MarkdownElement,c_String}]:={MarkdownParser[a],m,MarkdownParser[c]}
MarkdownParser[{a__,m_MarkdownElement,c__}]:={MarkdownParser[a],m,MarkdownParser[c]}
MarkdownParser[l_List]:=l
MarkdownParser[l_List]/;AllTrue[StringQ][l]:=(StringRiffle/*StringJoin@l)


(* ::Subsubsection::Closed:: *)
(*MarkdownElements*)


(* MarkdownElements *)
MarkdownParser[MarkdownElement[t_String,d_List]]/;(\[Not]StringMatchQ["TableHeader"][t]):=MarkdownElement[t,MarkdownParser[d]]
MarkdownParser[MarkdownElement[t_Symbol,d_List]]:=MarkdownElement[t,MarkdownParser[d]]
MarkdownParser[m:MarkdownElement["LaTex",(_Association|_String)]]:=m
MarkdownParser[MarkdownElement[t_,d_String]]:=MarkdownElement[t,MarkdownParser[d]]


(* ::Subsubsection::Closed:: *)
(*Leftovers*)


(* Leftover *)
MarkdownParser[m_MarkdownElement]:=m
MarkdownParser[s__]:=Sequence[s]


(* ::Section:: *)
(*MarkdownParse*)


MarkdownParse[file_File]:=MarkdownParse[Information[file]["FileName"]]
MarkdownParse[file_String]/;FileExistsQ[file]:=Block[
	{
	footFile=ExtractAllMarkdownFootnotes[file],
	$footnote=RegularExpression["(^|\\n)\\s*(\\[\\d+\\]\\:.*)(\\n|$)"],
	lines=(Import[#,"Text"]&)/*MarkdownTableParse/*(If[StringQ[#],StringSplit[#,"\n"],#]&/@#&)@file,
	parsedLines,footnoteCheck,parse1,parse1clean,parseTables,completedParse
	},
	(* Repeatedly apply the parser to each line until the expression doesn't change *)
	parsedLines=(FixedPoint[MarkdownParser,#]&/@lines);
	(* Replace footnote references with their respective URLs *)
	footnoteCheck=(parsedLines/.MarkdownElement["FootnoteReference",{ref_}]:>First@ExtractMarkdownFootnoteURL[ref,footFile]);
	(* Get rid of the footnote residue *)
	parse1=If[StringQ[#]\[And]StringMatchQ[$footnote][#],StringReplace[$footnote-> "(wasfootnote)"][#],#]&/@footnoteCheck;
	parse1clean=DeleteCases["(wasfootnote)"][parse1]
	
]


(* ::Chapter:: *)
(*End Package*)


End[]
Protect["MarkdownParse`*"];
EndPackage[]
