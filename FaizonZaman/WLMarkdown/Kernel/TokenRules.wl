BeginPackage["FaizonZaman`WLMarkdown`TokenRules`"]

$CommonMarkSpacesIndentationLength::usage = "The number of space characters interpreted as an indentation"

Begin["`Private`"]
Needs["FaizonZaman`WLMarkdown`Utilities`"]

(* Template Markdown Expressions *)
$Token = FaizonZaman`WLMarkdown`MarkdownToken[<| "Token" -> #Token |>]&
$TokenData = FaizonZaman`WLMarkdown`MarkdownToken[<| "Token" -> #Token, "Data" -> #Data |>]&
$TokenLevelData = FaizonZaman`WLMarkdown`MarkdownToken[<| "Token" -> #Token, "Level" -> #Level, "Data" -> #Data |>]&

(* Shared *)
(* Rules shared by Markdown Flavors can go here *)
(* Then use them in TokenRules for that flavor *)
$EmptyLineRule = RegularExpression[ "^$" ] :> $Token[ <| "Token" -> "EmptyLine" |> ]
$HorizontalLineRule = RegularExpression[ "^-{3}$" ] :> $Token[ <| "Token" -> "HorizontalLine" |> ]
$CodeFenceRule = RegularExpression[ "^(\\`{3})(.*)$" ] :> $TokenData[ <| "Token" -> "CodeFence", "Data" -> "$2" |> ]
$LineRule = RegularExpression[ "^(.*)$" ] :> $TokenData[ <| "Token" -> "Line", "Data" -> "$1" |> ]

(* TokenRules *)

(* CommonMark *)
(* TODO: Table Header *)
(* TODO: Table Row *)
(* TODO: Footnotes *)
(* TODO: Styles *)
(* TODO: Hyperlinks *)
FaizonZaman`WLMarkdown`TokenRules["CommonMark"] = {
    (* Empty Line *)
    $EmptyLineRule,
    (* Horizontal Line *)
    $HorizontalLineRule,
    (* Headings 1~6 *)
    RegularExpression[ "^(\\#{1,6}\\s)(.*)" ] :> $TokenLevelData[ <| "Token" -> "Heading", "Level" -> StringLength["$1"] - 1, "Data" -> "$2" |> ],
    (* UnorderedListItems *)
    RegularExpression[ "^(([\\s{"~~ToString[Replace[$MarkdownIndentationSize, Automatic -> 2]]~~"}\\t])*)\\*\\s(.*)$" ] :> $TokenLevelData[ <| "Token" -> "UnorderedListItem", "Level" -> GetIndentationLevel["$1"], "Data" -> "$3" |> ],
    (* OrderedListItems *)
    RegularExpression[ "^((\\s{"~~ToString[Replace[$MarkdownIndentationSize, Automatic -> 2]]~~"}|\\t)*)((\\d\\.)+\\d?)\\s(.*)$" ] :> $TokenLevelData[ <| "Token" -> "OrderedListItem", "Level" -> GetIndentationLevel["$1"], "Data" -> "$5" |> ],
    (* BlockQuote *)
    RegularExpression[ "^(\\s{4})(.*)$" ] :> $TokenData[ <| "Token" -> "BlockQuote", "Data" -> "$2" |> ],
    (* CodeFence *)
    $CodeFenceRule,
    (* Quote *)
    RegularExpression[ "^(\\>)\\s(.*)" ] :> $TokenData[ <| "Token" -> "Quote", "Data" -> "$2" |> ],
    (* Line *)
    $LineRule
}

FaizonZaman`WLMarkdown`TokenRules[flavor_String]:= (Message[MarkdownRules::invf, flavor];$Failed)

FaizonZaman`WLMarkdown`TokenRules::invf = "No token rules defined for flavor \"``\""

End[]
EndPackage[]
