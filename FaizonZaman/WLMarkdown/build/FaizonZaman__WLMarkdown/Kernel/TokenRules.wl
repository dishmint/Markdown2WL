BeginPackage["FaizonZaman`WLMarkdown`TokenRules`"]

Begin["`Private`"]
Needs["FaizonZaman`WLMarkdown`Utilities`"]

(* -------------------------------------------------------------------------- *)
(*                          Template Markdown Tokens                          *)
(* -------------------------------------------------------------------------- *)
$Token = FaizonZaman`WLMarkdown`MarkdownToken[<| "Token" -> #Token |>]&
$TokenData = FaizonZaman`WLMarkdown`MarkdownToken[<| "Token" -> #Token, "Data" -> #Data |>]&
$TokenLevelData = FaizonZaman`WLMarkdown`MarkdownToken[<| "Token" -> #Token, "Level" -> #Level, "Data" -> #Data |>]&

$TokenPattern[tok_] := FaizonZaman`WLMarkdown`MarkdownToken[KeyValuePattern["Token" -> tok]]
$TokenPattern[tok_, rest__Rule] := FaizonZaman`WLMarkdown`MarkdownToken[KeyValuePattern[{"Token" -> tok, rest}]]

(* $MDIS := ToString[ Replace[$MarkdownIndentationSize, Automatic -> 2] ] *)

(* -------------------------------------------------------------------------- *)
(*                              Shared line rules                             *)
(* -------------------------------------------------------------------------- *)

(* Rules shared by Markdown Flavors can go here *)
(* Then use them in TokenRules for that flavor *)
$EmptyLineRule = RegularExpression[ "^$" ] :> $Token[ <| "Token" -> "EmptyLine" |> ]
$HorizontalLineRule = RegularExpression[ "^-{3}$" ] :> $Token[ <| "Token" -> "HorizontalLine" |> ]
$CodeFenceRule = RegularExpression[ "^(\\`{3})(.*)$" ] :> $TokenData[ <| "Token" -> "CodeFence", "Data" -> "$2" |> ]
$LineRule = RegularExpression[ "^(.*)$" ] :> $TokenData[ <| "Token" -> "Line", "Data" -> "$1" |> ]


(* -------------------------------------------------------------------------- *)
(*                              CommonMark Rules                              *)
(* -------------------------------------------------------------------------- *)

(* ------------------------------- Line rules ------------------------------- *)
(* TODO: Hyperlinks|Footnotes|Images *)

FaizonZaman`WLMarkdown`LineRules["CommonMark"] = {
    (* Empty Line *)
    $EmptyLineRule,
    (* Horizontal Line *)
    $HorizontalLineRule,
    (* Headings 1~6 *)
    RegularExpression[ "^(\\#{1,6}\\s)(.*)" ] :> $TokenLevelData[ <| "Token" -> "Heading", "Level" -> StringLength["$1"] - 1, "Data" -> "$2" |> ],
    (* UnorderedListItems *)
    RegularExpression[ "^(([\\s{2}\\t])*)\\*\\s(.*)$" ] :> $TokenLevelData[ <| "Token" -> "UnorderedListItem", "Level" -> GetIndentationLevel["$1"], "Data" -> "$3" |> ],
    (* OrderedListItems *)
    RegularExpression[ "^((\\s{2}|\\t)*)((\\d\\.)+\\d?)\\s(.*)$" ] :> $TokenLevelData[ <| "Token" -> "OrderedListItem", "Level" -> GetIndentationLevel["$1"], "Data" -> "$5" |> ],
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

(* ------------------------------- Block rules ------------------------------ *)

FaizonZaman`WLMarkdown`BlockRules["CommonMark"] = {
    (* CodeBlock *)
    {$TokenPattern["EmptyLine"], block: Shortest[PatternSequence[$TokenPattern["CodeFence"], $TokenPattern["Line"].., $TokenPattern["CodeFence"]]], $TokenPattern["EmptyLine"]} :> Sequence[$Token[<| "Token" -> "EmptyLine" |> ], $TokenData[ <| "Token" -> "CodeBlock", "Data" -> {block} |>], $Token[<| "Token" -> "EmptyLine" |> ]],
    (* Table *)
    {
        $TokenPattern["EmptyLine"],
        header : $TokenPattern["Line", "Data" -> h_ /; StringMatchQ[h, RegularExpression["(.+?[|])(.+?[|]?)*"]]],
        alignment : $TokenPattern["Line", "Data" -> a_ /; StringMatchQ[a, RegularExpression["(^\\s?:?-+:?\\s?[|])(\\s?:?-+:?\\s?[|]?)*"]]],
        rows: Shortest[$TokenPattern["Line"]..],
        $TokenPattern["EmptyLine"]
    } :> Sequence[ $Token[<|"Token" -> "EmptyLine"|>], $TokenData[<|"Token" -> "Table", "Data" -> {header, alignment, {rows}}|>], $Token[<| "Token" -> "EmptyLine" |>] ],
    (* UnorderedList *)
    {$TokenPattern["EmptyLine"], ulist: Shortest[$TokenPattern["UnorderedListItem"]..], $TokenPattern["EmptyLine"]} :> Sequence[$Token[<| "Token" -> "EmptyLine" |> ], $TokenData[ <| "Token" -> "UnorderedList", "Data" -> {ulist} |>], $Token[<| "Token" -> "EmptyLine" |> ]],
    (* OrderedList *)
    {$TokenPattern["EmptyLine"], olist: Shortest[$TokenPattern["OrderedListItem"]..], $TokenPattern["EmptyLine"]} :> Sequence[$Token[<| "Token" -> "EmptyLine" |> ], $TokenData[ <| "Token" -> "OrderedList", "Data" -> {olist} |>], $Token[<| "Token" -> "EmptyLine" |> ]]
}

(* ----------------------------- Delimiter rules ---------------------------- *)
MergeDelimiters[dasc_?AssociationQ] := ( dasc // Values // Apply[Join]/*Apply[Alternatives] )
FaizonZaman`WLMarkdown`MarkdownDelimiters["CommonMark"] = MergeDelimiters@<| "Emphasis" -> {"*","_","`"},  "LaTex" -> { "\\[","\\]","$","\\(","\\)" } |>;

FaizonZaman`WLMarkdown`DelimiterRules["CommonMark"] = {
    d: FaizonZaman`WLMarkdown`MarkdownDelimiters["CommonMark"] :> $TokenData[ <| "Token" -> "Delimiter", "Data" -> d |>]
}

(* ------------------------------- Link rules ------------------------------- *)

FaizonZaman`WLMarkdown`LinkRules["CommonMark"] = {
    (* Hyperlinks *)
    Shortest["["~~label__~~"]"~~"("~~url__~~")"] :> $TokenData[ <| "Token" -> "HyperLink", "Data" -> {label, url} |>],
    Shortest["<"~~url__~~">"] :> $TokenData[ <| "Token" -> "Hyperlink", "Data" -> url |>],
    Shortest["["~~label__~~"]["~~url__~~"]"] :> $TokenData[ <| "Token" -> "FootnoteReference", "Data" -> {label, url} |>],
    (* Images *)
    Shortest["!["~~label__~~"]("~~url__~~")"] :> $TokenData[ <| "Token" -> "Image", "Data" -> {label, url} |>]
}

(* -------------------------------------------------------------------------- *)
(*                                  Messages                                  *)
(* -------------------------------------------------------------------------- *)

FaizonZaman`WLMarkdown`LineRules[flavor_String] := (Message[LineRules::invf, flavor];$Failed)
FaizonZaman`WLMarkdown`LinkRules[flavor_String] := (Message[LinkRules::invf, flavor];$Failed)
FaizonZaman`WLMarkdown`BlockRules[flavor_String] := (Message[BlockRules::invf, flavor];$Failed)
FaizonZaman`WLMarkdown`DelimiterRules[flavor_String] := (Message[DelimiterRules::invf, flavor];$Failed)

FaizonZaman`WLMarkdown`LineRules::invf = "No line tokenization rules defined for flavor \"``\""
FaizonZaman`WLMarkdown`LinkRules::invf = "No link tokenization rules defined for flavor \"``\""
FaizonZaman`WLMarkdown`BlockRules::invf = "No block tokenization rules defined for flavor \"``\""
FaizonZaman`WLMarkdown`DelimiterRules::invf = "No delimiter tokenization rules defined for flavor \"``\""

End[]
EndPackage[]
