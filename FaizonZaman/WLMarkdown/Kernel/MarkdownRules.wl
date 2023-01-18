BeginPackage["FaizonZaman`WLMarkdown`MarkdownRules`"]

MarkdownRules::usage = "MarkdownRules[f] gives the rules for Markdown flavor f"
MarkdownRules::invf = "No MarkdownRule defined for flavor \"``\""

Begin["`Private`"]

(* Template Markdown Expressions *)
$Token = FaizonZaman`WLMarkdown`MarkdownToken[<| "Element" -> #Token |>]&
$TokenData = FaizonZaman`WLMarkdown`MarkdownToken[<| "Element" -> #Token, "Data" -> #Data |>]&
$TokenLevelData = FaizonZaman`WLMarkdown`MarkdownToken[<| "Element" -> #Token, "Level" -> #Level, "Data" -> #Data |>]&

(* Shared *)
(* Rules shared by Markdown Flavors can go here *)
(* Then use them in MarkdownRules for that flavor *)
$EmptyLineRule = RegularExpression[ "^$" ] :> $Token[ <| "Token" -> "EmptyLine" |> ]
$HorizontalLineRule = RegularExpression[ "^-{3}$" ] :> $Token[ <| "Token" -> "HorizontalLine" |> ]
$CodeFenceRule = RegularExpression[ "^(\\`{3})(.*)$" ] :> $TokenData[ <| "Token" -> "CodeFence", "Data" -> "$2" |> ]
$ParagraphRule = RegularExpression[ "^(.*)$" ] :> $TokenData[ <| "Token" -> "Paragraph", "Data" -> "$1" |> ]

(* MarkdownRules *)

(* CommonMark *)

MarkdownRules["CommonMark"] = {
    (* Empty Line *)
    $EmptyLineRule,
    (* Horizontal Line *)
    $HorizontalLineRule,
    (* Headings 1~6 *)
    RegularExpression[ "^(\\#{1,6}\\s)(.*)" ] :> $TokenLevelData[ <| "Token" -> "Heading", "Level" -> StringLength["$1"] - 1, "Data" -> "$2" |> ],
    (* Bullets *)
    RegularExpression[ "^(\\s{2})*\\*\\s(.*)$" ] :> $TokenLevelData[ <| "Token" -> "Bullet", "Level" -> ( StringLength["$1"] / 2 ), "Data" -> "$2" |> ],
    (* BlockQuote *)
    RegularExpression[ "^(\\s{4})(.*)$" ] :> $TokenData[ <| "Token" -> "BlockQuote", "Data" -> "$2" |> ],
    (* CodeFence *)
    $CodeFenceRule,
    (* Quote *)
    RegularExpression[ "^(\\>)(.*)" ] :> $TokenData[ <| "Token" -> "Quote", "Data" -> "$2" |> ],
    (* Paragraph *)
    $ParagraphRule
}

MarkdownRules[flavor_String]:= (Message[MarkdownRules::invf, flavor];$Failed)

End[]
EndPackage[]
