BeginPackage["FaizonZaman`WLMarkdown`TokenRules`"]

Begin["`Private`"]
Needs["FaizonZaman`WLMarkdown`Utilities`"]

(* Template Markdown Tokens *)
$Token = FaizonZaman`WLMarkdown`MarkdownToken[<| "Token" -> #Token |>]&
$TokenData = FaizonZaman`WLMarkdown`MarkdownToken[<| "Token" -> #Token, "Data" -> #Data |>]&
$TokenLevelData = FaizonZaman`WLMarkdown`MarkdownToken[<| "Token" -> #Token, "Level" -> #Level, "Data" -> #Data |>]&

$MDIS := ToString[ Replace[$MarkdownIndentationSize, Automatic -> 2] ]
(* Shared *)
(* Rules shared by Markdown Flavors can go here *)
(* Then use them in TokenRules for that flavor *)
$EmptyLineRule = RegularExpression[ "^$" ] :> $Token[ <| "Token" -> "EmptyLine" |> ]
$HorizontalLineRule = RegularExpression[ "^-{3}$" ] :> $Token[ <| "Token" -> "HorizontalLine" |> ]
$CodeFenceRule = RegularExpression[ "^(\\`{3})(.*)$" ] :> $TokenData[ <| "Token" -> "CodeFence", "Data" -> "$2" |> ]
$LineRule = RegularExpression[ "^(.*)$" ] :> $TokenData[ <| "Token" -> "Line", "Data" -> "$1" |> ]
(* NOTE: DelimiterPatterns should return a list of {before, LFD, __, RFD, after} *)
(* NOTE: All three of these rules could be two: $LeftDelimiterRule, $RightDelimiterRule *)
(* $LeftDelimiterRule = RegularExpression["bdel:leftdel:adel"] :> $TokenData[ <| "Token" -> "LeftDelimiter", "Data" -> leftdel |>] *)
$ItalicRule = RegularExpression[ "(?:\\s|^)_([^_].+[^_])_(?:\\s|$)" ] :> $TokenData[ <| "Token" -> "Italic", "Data" -> "$1" |> ]
$BoldRule = RegularExpression[ "(?:[^*]|^)\\*{2}([^*].+[^*])\\*{2}(?:[^*]|$)" ] :> $TokenData[ <| "Token" -> "Bold", "Data" -> "$1" |> ]
$InlineCodeRule = RegularExpression[ "(?:[^`]|^)\\`([^`].+[^`])\\`(?:[^`]|$)" ] :> $TokenData[ <| "Token" -> "InlineCode", "Data" -> "$1" |> ]

(* TokenRules *)

(* CommonMark *)
(* TODO: LaTex *)
(* TODO: Hyperlinks|Footnotes|Images *)

FaizonZaman`WLMarkdown`TokenRules["CommonMark"] = {
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

FaizonZaman`WLMarkdown`SubTokenRules["CommonMark"] = {
    (* Emphasis *)
    $ItalicRule,
    $BoldRule,
    $InlineCodeRule
}

FaizonZaman`WLMarkdown`TokenRules[flavor_String] := (Message[TokenRules::invf, flavor];$Failed)
FaizonZaman`WLMarkdown`SubTokenRules[flavor_String] := (Message[SubTokenRules::invf, flavor];$Failed)

FaizonZaman`WLMarkdown`TokenRules::invf = "No token rules defined for flavor \"``\""
FaizonZaman`WLMarkdown`SubTokenRules::invf = "No subtoken rules defined for flavor \"``\""

End[]
EndPackage[]
