BeginPackage["FaizonZaman`WLMarkdown`ElementRules`"]
$Element::usage = "$Element[asc] create a MarkdownElement from Association asc"
$ElementData::usage = "$ElementData[asc] create a MarkdownElement from Association asc"
$ElementLevelData::usage = "$ElementLevelData[asc] create a MarkdownElement from Association asc"
Begin["`Private`"]
(* Template Markdown Elements *)
$Element = FaizonZaman`WLMarkdown`MarkdownElement[<| "Element" -> #Element |>]&
$ElementData = FaizonZaman`WLMarkdown`MarkdownElement[<| "Element" -> #Element, "Data" -> #Data |>]&
$ElementLevelData = FaizonZaman`WLMarkdown`MarkdownElement[<| "Element" -> #Element, "Marker"-> #Marker, "Level" -> #Level, "Data" -> #Data |>]&

(* Shared element rules *)
$TokenElement = FaizonZaman`WLMarkdown`MarkdownToken[KeyValuePattern[{"Token"->token_}]] :> $Element[<|"Element" -> token|>]
$TokenElementData = FaizonZaman`WLMarkdown`MarkdownToken[KeyValuePattern[{"Token"->token_, "Data"->data_}]] :> $ElementData[<|"Element" -> token, "Data"-> data|>]
$TokenElementLevelData = FaizonZaman`WLMarkdown`MarkdownToken[KeyValuePattern[{"Token"->token_, "Marker"-> marker_, "Level"->level_, "Data"->data_}]] :> $ElementLevelData[<|"Element" -> token, "Marker" -> marker, "Level" -> level, "Data" -> data|>]

FaizonZaman`WLMarkdown`TokenToElementRules["CommonMark"] = {
    (* For: List *)
    $TokenElementLevelData,
    (* For: CodeBlock, Table, Blockquote *)
    $TokenElementData,
    (* For: EmptyLine, HorizontalLine *)
    $TokenElement
}

FaizonZaman`WLMarkdown`TokenToElementRules[flavor_String] := (Message[TokenToElementRules::invf, flavor];$Failed)

FaizonZaman`WLMarkdown`TokenToElementRules::invf = "No element rules defined for flavor \"``\""
End[]
EndPackage[]