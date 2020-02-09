(* ::Package:: *)

(* ::Title:: *)
(*Markdown to Wolfram Language*)


(* ::Abstract:: *)
(*Supports conversion of .md files to WL constructs*)


(* ::Subtitle:: *)
(*Begin Package*)


BeginPackage["Markdown2WL`"]
(* \[DownArrow] Allow Refresh of Definitions on Get call \[DownArrow] *)
Unprotect["Markdown2WL`*"];
ClearAll["Markdown2WL`*"];
ClearAll["Markdown2WL`Private`*"];
(* \[UpArrow] Can be removed in Production             \[UpArrow] *)
rowify::usage = "rowify[\!\(\*
StyleBox[\"stringLine\",\nFontSlant->\"Italic\"]\)\!\(\*
StyleBox[\"]\",\nFontSlant->\"Italic\"]\) Processes the line \!\(\*
StyleBox[\"stringLine\",\nFontSlant->\"Italic\"]\) and wraps it with Row"
findFootnote::usage = "findFootnote[\!\(\*
StyleBox[\"ref\",\nFontSlant->\"Italic\"]\), \!\(\*
StyleBox[\"l\",\nFontSlant->\"Italic\"]\)] finds the footnote with reference number \!\(\*
StyleBox[\"ref\",\nFontSlant->\"Italic\"]\) in line \!\(\*
StyleBox[\"l\",\nFontSlant->\"Italic\"]\)\!\(\*
StyleBox[\" \",\nFontSlant->\"Italic\"]\)and returns the URL."
processLine::usage = "processLine[l, footFile] processes line \!\(\*
StyleBox[\"l\",\nFontSlant->\"Italic\"]\)\!\(\*
StyleBox[\" \",\nFontSlant->\"Italic\"]\)to convert Markdown constructs into WL constructs.\n\!\(\*
StyleBox[\"footFile\",\nFontSlant->\"Italic\"]\) is not optional and is typically generated automatically when using the \!\(\*
StyleBox[\"markDownToWL\", \"Input\"]\) function"
markDownToWL::usage = "markDownToWL[\!\(\*
StyleBox[\"fmd\",\nFontSlant->\"Italic\"]\), \"Render\"-> rspec] Parses markdown file \!\(\*
StyleBox[\"fmd\",\nFontSlant->\"Italic\"]\) into Wolfram Language constructs. \"Render\" option is \"List\" by default, others are \"Column\" and \"Styled\". \"Notebook\" is a planned \"Render\" option, thus not yet supported."
Begin["Private`"]


(* ::Chapter:: *)
(*Support Functions*)


(* ::Section:: *)
(*Processing*)


(* ::Subsection::Closed:: *)
(*Row-ify*)


rowify:=(StringReplace[" ,"-> ","][#]&)/*ToExpression/*Row;


(* ::Subsection::Closed:: *)
(*Find Footnote*)


findFootnote[ref_, line_]:=Module[{},
	First@StringCases[
		line,
		{(Shortest[Repeated[" ",{2, Infinity}]~~"["~~ToString[ref]~~"]: "]~~Shortest[url__~~"\n"]):>url}]
		]


(* ::Subsection::Closed:: *)
(*Process Line*)


processLine[line_String,footfile_]:=Module[
{$b="**",$i="_",$c="`",
$h=h:(("######"|"#####"|"####"|"###"|"##"|"#")~~WhitespaceCharacter),delta
},
delta=FixedPoint[
StringReplace[#,
{
(* HEADINGS *)
$h~~chars__~~(EndOfString|EndOfLine):> "Style[Row[{\""<>chars<>Switch[(StringLength[h] - 1),
1,"\"}],\"Title\"]",
2,"\"}],\"Subtitle\"]",
3,"\"}],\"Subsection\"]",
4,"\"}],\"Subsubsection\"]",
5,"\"}],12]",
6,"\"}],6]"
],

(* HORIZONTAL RULE *)
("---"~~___~~EndOfString):> "\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]\[LongDash]",

(* ITALICS / BOLD *)
(StartOfString|StartOfLine)~~$i~~chars__~~$i~~(EndOfString|EndOfLine):> "Style[Row[{\""<>chars<>"\"}],Italic]",
(StartOfString|StartOfLine)~~$b~~chars__~~$b~~(EndOfString|EndOfLine):> "Style[Row[{\""<>chars<>"\"}],Bold]",

(StartOfString|StartOfLine)~~$i~~chars__~~$i:> "Style[Row[{\""<>chars<>"\"}],Italic],\"",
(StartOfString|StartOfLine)~~$b~~chars__~~$b:> "Style[Row[{\""<>chars<>"\"}],Bold],\"",

$i~~chars__~~$i~~(EndOfString|EndOfLine):> "\",Style[Row[{\""<>chars<>"\"}],Italic]",
$b~~chars__~~$b~~(EndOfString|EndOfLine):> "\",Style[Row[{\""<>chars<>"\"}],Bold]",

$i~~chars__~~$i:> "\",Style[Row[{\""<>chars<>"\"}],Italic],\"",
$b~~chars__~~$b:> "\",Style[Row[{\""<>chars<>"\"}],Bold],\"",

$c~~chars__~~$c:> "\",Style[Row[{\""<>chars<>"\"}],\"CodeText\", Blue],\"",

(StartOfString|StartOfLine)~~"    "~~chars__:> "Style[Row[{Tab,\""<>chars<>"\"}],\"CodeText\", Blue]",

(* URLs *)
("<"~~url__~~">"):> "\", Row[{Hyperlink[\""<>url<>"\"]}], \"",
(" ["~~label__~~"]("~~url__~~")"):>"\", Row[{\" \", Hyperlink[\""<>label<>"\",\""<>url<>"\"]}],\"",
(Shortest[" ["~~label__~~"]["~~ref:(DigitCharacter..)~~"]"]):>"\", Row[{\" \", Hyperlink[\""<>label<>"\",\""<>findFootnote[ref,footfile]<>"\"]}],\"",

(* QUOTEs *)
(">"~~(WhitespaceCharacter|"")~~stuff__~~EndOfString):> "Row[{Tab, Style[\""<>stuff<>"\",Gray,Italic]}]",

(* ORDERED ITEMs *)
(n:((DigitCharacter..)~~".")~~WhitespaceCharacter~~stuff__~~EndOfString):> "Row[{Tab,\""<>n<>"\", \" \", Style[Row[{\""<>stuff<>"\"}],\"Item\"]}]",

(* UNORDERED ITEMs *)
(n:"*"~~WhitespaceCharacter~~stuff__~~EndOfString):> "Row[{Tab,"<>"\"\[Bullet] \", Style[Row[{\""<>stuff<>"\"}],\"Item\"]}]"
}
]&
,line];
Which[
StringQ[delta]
\[And]StringContainsQ["Style"|"Row"|"Hyperlink"][delta]
\[And]!StringStartsQ["Style"|"Row"|"Hyperlink"][delta]
\[And]StringEndsQ["."|LetterCharacter][delta],rowify@("{\""<>delta<>"\"}" ),
StringQ[delta]
\[And]StringContainsQ["Style"|"Row"|"Hyperlink"][delta]
\[And]!StringStartsQ["Style"|"Row"|"Hyperlink"][delta],rowify@("{\""<>delta<>"}" ),
StringQ[delta]\[And]StringContainsQ["Style"|"Row"|"Hyperlink"][delta],rowify@("{"<>delta<>"}" ),
True,delta
]
]


(* ::Section:: *)
(*Markdown2WL*)


markDownToWL[fileName_String,OptionsPattern[{"Render"-> "List"}]]:=Module[
	{result,mdToWL, file=ReadList[fileName,String],footNoteLess,fileForFootnotes,
	$footNote=(Shortest[Repeated[" ",{2, Infinity}]~~"["~~(DigitCharacter..)~~"]: "]~~Shortest[__])
	},
	fileForFootnotes=file//((l\[Function]l<>"\n")/@#&)//StringJoin;
	mdToWL=(line\[Function]processLine[line,fileForFootnotes])/@file;
	footNoteLess=((ll\[Function]If[StringQ[ll],If[StringMatchQ[$footNote][ll],Missing[],ll],ll])/@mdToWL)//DeleteMissing;
	mdToWL=Riffle[footNoteLess," "];
	Switch[OptionValue["Render"],
		"List",mdToWL,
		"Column",(mdToWL)//Column,
		"Styled",Transpose@{mdToWL}//TextGrid,
		"Notebook","Not Yet Supported"
]
]


(* ::Subtitle:: *)
(*End Package*)


End[]
Protect["Markdown2WL`*"];
EndPackage[]
