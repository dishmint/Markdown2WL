(* ::Package:: *)

BeginPackage["MarkdownTokenize`"]

(* Declare your package's public symbols here. *)
TokenizeMarkdown

Begin["`Private`"]
Needs["CommonMark`"]

(* Tokenizer *)
Stage1Tokenizer[source_String] := StringSplit[source, "\n\n" -> MarkdownToken["EmptyLine"]];
Stage2Tokenizer[stage1_List] := SubsetMap[Map[StringSplit[#, "\n"]&], stage1, Position[stage1, _String, 1]];


TokenizeFragment[fragment_String] := StringSplit[
	fragment,
	{
		$CMHeading,
		$CMItalics
	}
]

Stage3Tokenizer[stage2_List] := Module[
	{spos = Position[stage2, _String, 2]},
	SubsetMap[Map[TokenizeFragment], stage2, spos]
		]

TokenizeMarkdown[s_String] := Module[
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
