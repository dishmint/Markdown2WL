BeginPackage["FaizonZaman`WLMarkdown`TokenRules`"]

Begin["`Private`"]
Needs["FaizonZaman`WLMarkdown`Utilities`"]

(* Template Markdown Tokens *)
$Token = FaizonZaman`WLMarkdown`MarkdownToken[<| "Token" -> #Token |>]&
$TokenData = FaizonZaman`WLMarkdown`MarkdownToken[<| "Token" -> #Token, "Data" -> #Data |>]&
$TokenLevelData = FaizonZaman`WLMarkdown`MarkdownToken[<| "Token" -> #Token, "Level" -> #Level, "Data" -> #Data |>]&

$TokenPattern[patt_] := FaizonZaman`WLMarkdown`MarkdownToken[KeyValuePattern["Token" -> patt]]

$MDIS := ToString[ Replace[$MarkdownIndentationSize, Automatic -> 2] ]
(* Shared *)
(* Rules shared by Markdown Flavors can go here *)
(* Then use them in TokenRules for that flavor *)
$EmptyLineRule = RegularExpression[ "^$" ] :> $Token[ <| "Token" -> "EmptyLine" |> ]
$HorizontalLineRule = RegularExpression[ "^-{3}$" ] :> $Token[ <| "Token" -> "HorizontalLine" |> ]
$CodeFenceRule = RegularExpression[ "^(\\`{3})(.*)$" ] :> $TokenData[ <| "Token" -> "CodeFence", "Data" -> "$2" |> ]
$LineRule = RegularExpression[ "^(.*)$" ] :> $TokenData[ <| "Token" -> "Line", "Data" -> "$1" |> ]


(* -------------------------------------------------------------------------- *)
(*                              CommonMark Rules                              *)
(* -------------------------------------------------------------------------- *)
(* TODO: Hyperlinks|Footnotes|Images *)

FaizonZaman`WLMarkdown`LineRules["CommonMark"] = {
    (* Empty Line *)
    $EmptyLineRule,
    (* Horizontal Line *)
    $HorizontalLineRule,
    (* Headings 1~6 *)
    RegularExpression[ "^(\\#{1,6}\\s)(.*)" ] :> $TokenLevelData[ <| "Token" -> "Heading", "Level" -> StringLength["$1"] - 1, "Data" -> "$2" |> ],
    (* UnorderedListItems *)
    RegularExpression[ "^(([\\s{"<>$MDIS<>"}\\t])*)\\*\\s(.*)$" ] :> $TokenLevelData[ <| "Token" -> "UnorderedListItem", "Level" -> GetIndentationLevel["$1"], "Data" -> "$3" |> ],
    (* OrderedListItems *)
    RegularExpression[ "^((\\s{"<>$MDIS<>"}|\\t)*)((\\d\\.)+\\d?)\\s(.*)$" ] :> $TokenLevelData[ <| "Token" -> "OrderedListItem", "Level" -> GetIndentationLevel["$1"], "Data" -> "$5" |> ],
    (* BlockQuote *)
    RegularExpression[ "^(\\s{4})(.*)$" ] :> $TokenData[ <| "Token" -> "BlockQuote", "Data" -> "$2" |> ],
    (* CodeFence *)
    $CodeFenceRule,
    (* Quote *)
    RegularExpression[ "^(\\>)\\s(.*)" ] :> $TokenData[ <| "Token" -> "Quote", "Data" -> "$2" |> ],
    (* Footnotes *)
    RegularExpression[ "^\\s*\\[(\\d+)\\]:\\s(.*)" ] :> $TokenData[ <| "Token" -> "Footnote", "Data" -> { "$1", "$2"} |> ],
    (* Line *)
    $LineRule
}

FaizonZaman`WLMarkdown`BlockRules["CommonMark"] = {
    (* CodeBlock *)
    {$TokenPattern["EmptyLine"], block: Shortest[PatternSequence[$TokenPattern["CodeFence"], $TokenPattern["Line"].., $TokenPattern["CodeFence"]]], $TokenPattern["EmptyLine"]} :> Sequence[$Token[<| "Token" -> "EmptyLine" |> ], $TokenData[ <| "Token" -> "CodeBlock", "Data" -> {block} |>], $Token[<| "Token" -> "EmptyLine" |> ]]
    (* Table *)
    (* List *)
}

FaizonZaman`WLMarkdown`MarkdownDelimiters["CommonMark"] = <| "Emphasis" -> "*"|"_"|"`", "Tables" ->"\\|",  "LaTex" -> "\\["|"\\]"|"$"|"\\("|"\\)" |> // Values // Apply[Join];

FaizonZaman`WLMarkdown`DelimiterRules["CommonMark"] = {
    (* Delimiters *)
    d: FaizonZaman`WLMarkdown`MarkdownDelimiters["CommonMark"] :> $TokenData[ <| "Token" -> "Delimiter", "Data" -> d |>]
}

FaizonZaman`WLMarkdown`LineRules[flavor_String] := (Message[LineRules::invf, flavor];$Failed)
FaizonZaman`WLMarkdown`DelimiterRules[flavor_String] := (Message[DelimiterRules::invf, flavor];$Failed)

FaizonZaman`WLMarkdown`LineRules::invf = "No line tokenization rules defined for flavor \"``\""
FaizonZaman`WLMarkdown`DelimiterRules::invf = "No delimiter tokenization rules defined for flavor \"``\""

End[]
EndPackage[]
