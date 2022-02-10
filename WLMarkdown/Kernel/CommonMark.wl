(* ::Package:: *)

BeginPackage["CommonMark`"]

(* Declare your package's public symbols here. *)

$CMHeading
$CMItalics

Begin["`Private`"]

(* Patterns *)
(* - Headings *)
$HeadingOpen = RegularExpression["^#{1,6}(?=\\s|\t)+"]
$HeadingClose = RegularExpression["(?<=(\\s|\t))+#{1,}$"]
$CMHeading = Splice[{$HeadingOpen, $HeadingClose}]
(* - Emphasis *)

$ItalicUnderscoreOpen = RegularExpression["(?<!_)_[^_\\s]"]
$ItalicUnderscoreClose = RegularExpression["[^_\\s]_(?!_)"]
$ItalicAsteriskOpen = RegularExpression["(?<![*])[*][^*\\s]"]
$ItalicAsteriskClose = RegularExpression["[^*\\s][*](?![*])"]
$CMItalics = Splice[{$ItalicUnderscoreOpen,$ItalicUnderscoreClose,$ItalicAsteriskOpen,$ItalicAsteriskClose}]

End[] (* End `Private` *)

EndPackage[]
