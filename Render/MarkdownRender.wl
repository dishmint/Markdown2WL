(* ::Package:: *)

(* ::Title:: *)
(*Markdown Render*)


(* ::Abstract:: *)
(*Defines Replacements to transform MarkdownElements into a rendered form*)


(* ::Subtitle:: *)
(*Begin Package*)


BeginPackage["MarkdownRender`"]
Needs["MarkdownParse`"]
(* \[DownArrow] Allow Refresh of Definitions on Get call \[DownArrow] *)
Unprotect["MarkdownRender`*"];
ClearAll["MarkdownRender`*"];
ClearAll["MarkdownRender`Private`*"];
(* \[UpArrow] Can be removed in Production             \[UpArrow] *)
MarkdownRender::usage="MarkdownRender[\*StyleBox[\"parselist\",\"TI\"]] Takes in the result of MarkdownParse, \*StyleBox[\"parselist\",\"TI\"], and returns a list of styled TextCells"
Begin["Private`"]


(* ::Chapter:: *)
(*Support Functions*)


(* ::Section:: *)
(*MarkdownRenderer*)


MarkdownRenderer[tag_,{s_String}]:=MarkdownRenderer[tag,s]
MarkdownRenderer[t:(Italic|Bold),s_String]:=TextCell[s,t]
MarkdownRenderer[t:(Italic|Bold),l_List]:=TextCell[Row[Riffle[l," "]],t]
MarkdownRenderer[Hyperlink,linkName_,url_String]:=Return[Hyperlink[linkName,url]]
MarkdownRenderer[Hyperlink,url_String]:=Return[Hyperlink[url]]
MarkdownRenderer[headingSpec_,data_]/;StringStartsQ["H"][headingSpec]:={TextCell[
	Row[Which[
		StringQ[data],{data},
		ListQ[data],Riffle[data," "]
		]],
	Switch[headingSpec,
		"H1","Title",
		"H2","Chapter",
		"H3","Section",
		(* Find different usecase for "Subtitle"*)
		(* Section could be used when a line of text directly follows  a line of --- *)
		"H4","Subsection",
		"H5","Subsubsection",
		"H6",6
		]
	]}
MarkdownRenderer["ItemNumbered",List[n_],data_]:={TextCell[
	Row[Which[
		StringQ[data],{data},
		ListQ[data],Riffle[data," "]
	]],
	"ItemNumbered"
	]}
MarkdownRenderer["Item",data_]:={TextCell[
	Row[Which[
		StringQ[data],{data},
		ListQ[data],Riffle[data," "]
		]],
		"Item"
	]}
MarkdownRenderer["Blockquote",data_]:={TextCell[
	Row[Which[
		StringQ[data],{Tab,data},
		ListQ[data],{Tab}~Join~Riffle[data," "]
		]],
		"CodeText"
	]}


(* ::Section:: *)
(*MarkdownRender*)


MarkdownRender[parselist_List]:=ReplaceAll[parselist, (*MarkdownParse`*)MarkdownElement -> MarkdownRenderer]


(* ::Subtitle:: *)
(*End Package*)


End[]
Protect["MarkdownRender`*"];
EndPackage[]
