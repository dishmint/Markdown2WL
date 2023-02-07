BeginPackage["FaizonZaman`WlMarkdown`ParserRules`"]
(* ParserRules for each flavor *)
(* Specify how to combine tokens... *)
Begin["`Private`"]
(* Template Markdown Elements *)
$Element = FaizonZaman`WLMarkdown`MarkdownElement[<| "Element" -> #Element |>]&
$ElementData = FaizonZaman`WLMarkdown`MarkdownElement[<| "Element" -> #Element, "Data" -> #Data |>]&

(* Shared parser rules *)
$TokenElement = FaizonZaman`WLMarkdown`MarkdownToken[<|"Token"->token_|>] :> $Element[<|"Element" -> token|>]

FaizonZaman`WLMarkdown`ParserRules["CommonMark"] = {
    (* TODO: CodeBlock *)
    (* TODO: Table *)
    (* TODO: Blockquote *)
    (* TODO: List *)
}

FaizonZaman`WLMarkdown`ParserRules[flavor_String] := (Message[ParserRules::invf, flavor];$Failed)

FaizonZaman`WLMarkdown`ParserRules::invf = "No parser rules defined for flavor \"``\""
End[]
EndPackage[]