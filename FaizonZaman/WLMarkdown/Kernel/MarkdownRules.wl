BeginPackage["FaizonZaman`WLMarkdown`MarkdownRules`"]

MarkdownRules::usage = "MarkdownRules[f] gives the rules for Markdown flavor f"

Begin["`Private`"]

(* StringTemplate for Markdown Expressions *)
$TokenContentTemplate = StringTemplate["MarkdownElement[<|\"Element\" -> \"`token`\", \"Content\" -> \"`content`\"|>]"]

$EmptyLineTemplate = StringTemplate["MarkdownElement[<|\"Element\" -> \"`token`\"|>]"]
$HeadingTemplate = StringTemplate["MarkdownElement[<|\"Element\" -> \"`token`\", \"Level\" -> `level`, \"Content\" -> \"`content`\"|>]"]
$BulletTemplate = StringTemplate["MarkdownElement[<|\"Element\" -> \"`token`\", \"Level\" -> `level`, \"Content\" -> \"`content`\"|>]"]
$BlockQuoteTemplate = $TokenContentTemplate
$CodeFenceTemplate = StringTemplate["MarkdownElement[<|\"Element\" -> \"`token`\", \"Language\" -> \"`language`\"|>]"]
$HorizontalLineTemplate = $EmptyLineTemplate
$QuoteTemplate = $TokenContentTemplate

(* Shared *)
(* Rules shared by Markdown Flavors can go here *)
(* Then use them in MarkdownRules for that flavor *)
$EmptyLineRule = RegularExpression[ "^$" ] :> $EmptyLineTemplate[ <| "token" -> "EmptyLine" |> ]
$CodeFenceRule = RegularExpression[ "^(\\`{3})(.*)$" ] :> $CodeFenceTemplate[ <| "token" -> "CodeFence", "language" -> "$2" |> ]
$HorizontalLineRule = RegularExpression[ "^-{3}$" ] :> $HorizontalLineTemplate[ <| "token" -> "HorizontalLine" |> ]

(* CommonMark *)

MarkdownRules["CommonMark"] = {
    (* Empty Line *)
    $EmptyLineRule,
    (* Horizontal Line *)
    $HorizontalLineRule,
    (* Headings 1~6 *)
    RegularExpression[ "^(\\#{1,6}\\s)(.*)" ] :> $HeadingTemplate[ <| "token" -> "Heading", "level" -> StringLength["$1"] - 1, "content" -> "$2" |> ],
    (* Bullets *)
    RegularExpression[ "^(\\s{2})*\\*\\s(.*)$" ] :> $BulletTemplate[ <| "token" -> "Bullet", "level" -> ( StringLength["$1"] / 2 ), "content" -> "$2" |> ],
    (* BlockQuote *)
    RegularExpression[ "^(\\s{4})(.*)$" ] :> $BlockQuoteTemplate[ <| "token" -> "BlockQuote", "content" -> "$2" |> ],
    (* CodeFence *)
    $CodeFenceRule,
    (* Quote *)
    RegularExpression[ "^(\\>)(.*)" ] :> $QuoteTemplate[ <| "token" -> "Quote", "content" -> "$2" |> ]
}

MarkdownRules::noflvr = "No MarkdownRules defined for ``"
MarkdownRules[flavor_] = Message[MarkdownRules::noflvr, flavor]

End[]
EndPackage[]
