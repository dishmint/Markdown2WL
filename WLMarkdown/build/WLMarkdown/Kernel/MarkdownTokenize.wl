(* ::Package:: *)

BeginPackage["WLMarkdown`MarkdownTokenize`"]

(* Declare your package's public symbols here. *)
Stage1Tokenizer
Stage2Tokenizer
Stage3Tokenizer

Begin["`Private`"]
Needs["WLMarkdown`CommonMark`"]

(* Tokenizer *)
Stage1Tokenizer[source_String] := StringSplit[source, "\n\n" -> WLMarkdown`MarkdownToken["EmptyLine",{}]];
Stage2Tokenizer[stage1_List] := SubsetMap[Map[StringSplit[#, "\n"]&], stage1, Position[stage1, _String, 1]];


TokenizeFragment[fragment_String] := StringSplit[
	fragment,
	{
		(* Delimiters *)
		$LFD,
		$RFD
	}
]

Stage3Tokenizer[stage2_List] := Module[
	{spos = Position[stage2, List[__String]]},
	SubsetMap[Map[Flatten@*Map[TokenizeFragment]], stage2, spos]
		]

WLMarkdown`TokenizeMarkdown[s_String] := Module[
	{stage1,stage2},
	(* Stage 1 - Split at Empty Lines *)
	stage1 = Stage1Tokenizer[s];
	(* Stage 3 - Split Fragments by Newline *)
	stage2 = Stage2Tokenizer[stage1];
	(* Stage 3 - Tokenize Fragments *)
	Stage3Tokenizer[stage2]
		]

End[] (* End `Private` *)

EndPackage[]
