BeginPackage["FaizonZaman`WLMarkdown`Parser`"]
Begin["`Private`"]

FaizonZaman`WLMarkdown`MarkdownParser[ tokens_List, rules_List ] := SequenceReplace[ tokens, rules ]

End[]
EndPackage[]