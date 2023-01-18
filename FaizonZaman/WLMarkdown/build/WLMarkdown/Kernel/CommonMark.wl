(* ::Package:: *)

BeginPackage["WLMarkdown`CommonMark`"]

(* Declare your package's public symbols here. *)

$LFD
$RFD

Begin["`Private`"]

$DelRun = "([_*]+)"

(* Left Flanking Delimiter *)
(* ((?<![_*])([_*]+)(?![\s_*])(?![[:punct:]]))|((?<=[\s]|[[:punct:]])(?<![_*])([_*]+)(?![\s_*])(?=[[:punct:]]))  *)
(* $LFD1   = "((?:(?<![_*])|^)([_*]+)(?![\\s_*])(?![[:punct:]]))" *)
$LFD1   = "((?:(?<![_*]|[^\\s])|^)([_*]+)(?![\\s_*])(?![[:punct:]]))"

$LFD2   = "((?<=\\s|[[:punct:]]|^)(?<![_*])([_*]+)(?![\\s_*])(?=[[:punct:]]))"

(* Right Flanking Delimiter *)
(* ((?<!\s|[[:punct:]])(?<=[^_*])([_*]+))|((?<!\s)(?<=[[:punct:]])(?<=[^_*])([_*]+)(?=\s|[[:punct:]])) *)
$RFD1   = "((?<!\\s|^|[[:punct:]])(?<=[^_*])([_*]+)(?=[^_*]|$))"

$RFD2   = "((?<!\\s|^)(?<=[[:punct:]])(?<=[^_*])([_*]+)(?=\\s|$|[[:punct:]]))"

(* Patterns *)
(* - Left Flanking Delimiters *)
$LFD = Splice[
	{
		RegularExpression[$LFD1] :> WLMarkdown`MarkdownToken["LFD", "$2"],
		RegularExpression[$LFD2] :> WLMarkdown`MarkdownToken["LFD", "$2"]
	}
	]

$RFD = Splice[
	{
		RegularExpression[$RFD1] :> WLMarkdown`MarkdownToken["RFD", "$2"],
		RegularExpression[$RFD2] :> WLMarkdown`MarkdownToken["RFD", "$2"]
	}
	]
End[] (* End `Private` *)

EndPackage[]
