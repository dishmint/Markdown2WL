BeginPackage["FaizonZaman`WLMarkdown`Samples`"]

Begin["`Private`"]

FaizonZaman`WLMarkdown`$CommonMarkSample = Import[FileNameJoin[{DirectoryName[$InputFileName, 2], "Examples", "CommonMark.md"}], "Text"];

End[]
EndPackage[]