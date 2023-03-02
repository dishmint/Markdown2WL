BeginPackage["FaizonZaman`WlMarkdown`ParserRules`"]
(* ParserRules for each flavor *)
(* Specify how to combine tokens... *)
Begin["`Private`"]
(* Template Markdown Elements *)
$Element = FaizonZaman`WLMarkdown`MarkdownElement[<| "Element" -> #Element |>]&
$ElementData = FaizonZaman`WLMarkdown`MarkdownElement[<| "Element" -> #Element, "Data" -> #Data |>]&

(* DelimiterParser *)
$DelimiterTokenPattern = FaizonZaman`WlMarkdown`MarkdownToken[KeyValuePattern[{"Token" -> "Delimiter", "Data" -> s_}]]
DelimeterPresentAndTokenFreeQ = Function[{expr}, Through[And[Not@*FreeQ[_LFD | _RFD | _String], FreeQ[_FaizonZaman`WLMarkdown`MarkdownToken]][expr]]]
TokenPresentQ = Function[{expr}, Not@*FreeQ[_FaizonZaman`WLMarkdown`MarkdownToken]]
iDelimiterParser[expr_List] := Replace[expr, {before___, $DelimiterTokenPattern, t__, $DelimiterTokenPattern, after___} :> {before, $ElementData[<| "Element" -> s, "Data" -> {t}|> ], after}] /; DelimeterPresentAndTokenFreeQ[expr]
iDelimiterParser[expr_List] := SubsetMap[Map[Replace[#, x_List :> iDelimiterParser[x], Infinity] &], expr, Position[expr, _FaizonZaman`WLMarkdown`MarkdownToken]] /; TokenPresentQ[expr]
DelimterParser[expr_List] := FixedPoint[ iDelimiterParser, expr ]
(* 1 - Parse Blocks *)
(* 2 - Parse DelimitedSequences *)
(* Shared parser rules *)
$TokenElement = FaizonZaman`WLMarkdown`MarkdownToken[<|"Token"->token_|>] :> $Element[<|"Element" -> token|>]

FaizonZaman`WLMarkdown`ParserRules["CommonMark"] = {
    (* TODO: Delimited *)
    (* TODO: CodeBlock *)
    (* TODO: Table *)
    (* TODO: Blockquote *)
    (* TODO: List *)
}

FaizonZaman`WLMarkdown`ParserRules[flavor_String] := (Message[ParserRules::invf, flavor];$Failed)

FaizonZaman`WLMarkdown`ParserRules::invf = "No parser rules defined for flavor \"``\""
End[]
EndPackage[]