BeginPackage["FaizonZaman`WLMarkdown`TokenRules`"]

Begin["`Private`"]
Needs["FaizonZaman`WLMarkdown`Utilities`"]

(* -------------------------------------------------------------------------- *)
(*                          Template Markdown Tokens                          *)
(* -------------------------------------------------------------------------- *)
$Token = FaizonZaman`WLMarkdown`MarkdownToken[<| "Token" -> #Token |>]&
$TokenData = FaizonZaman`WLMarkdown`MarkdownToken[<| "Token" -> #Token, "Data" -> #Data |>]&
$TokenLevelData = FaizonZaman`WLMarkdown`MarkdownToken[<| "Token" -> #Token, "Marker"-> #Marker,"Level" -> #Level, "Data" -> #Data |>]&

$TokenPattern[tok_] := FaizonZaman`WLMarkdown`MarkdownToken[KeyValuePattern["Token" -> tok]]
$TokenPattern[tok_, rest__Rule] := FaizonZaman`WLMarkdown`MarkdownToken[KeyValuePattern[{"Token" -> tok, rest}]]

ChangeToken[FaizonZaman`WLMarkdown`MarkdownToken[tok_], newTokenType_String]:= FaizonZaman`WLMarkdown`MarkdownToken[ReplacePart[tok, Key["Token"] -> newTokenType]]
(* $MDIS := ToString[ Replace[$MarkdownIndentationSize, Automatic -> 2] ] *)

(* -------------------------------------------------------------------------- *)
(*                              Shared line rules                             *)
(* -------------------------------------------------------------------------- *)

(* Rules shared by Markdown Flavors can go here *)
(* Then use them in TokenRules for that flavor *)
$EmptyLineRule = RegularExpression[ "^$" ] :> $Token[ <| "Token" -> "EmptyLine" |> ]
$ThematicBreakRule = RegularExpression[ "^\\s{0,3}([-]{3,}|[_]{3,}|[*]{3,})$" ] :> $Token[ <| "Token" -> "ThematicBreak" |> ]
$CodeFenceRule = RegularExpression[ "^(\\`{3})(.*)$" ] :> $TokenData[ <| "Token" -> "CodeFence", "Data" -> "$2" |> ]
$LineRule = RegularExpression[ "^(.*)$" ] :> $TokenData[ <| "Token" -> "Line", "Data" -> "$1" |> ]


(* -------------------------------------------------------------------------- *)
(*                              CommonMark Rules                              *)
(* -------------------------------------------------------------------------- *)

ATXHeadingQ[lead_] /; StringLength /* LessEqualThan[6] @ lead := StringLength[lead]
ATXHeadingQ[lead_] := False

FormHeading[level_Integer, data_, _] := $TokenLevelData[ 
    <| 
        "Token" -> "Heading", 
        "Level" -> level, 
        "Data" -> StringReplace[ data, "\\#" -> "#" ] (* Replace escaped # presumably at the end of the heading line with unescaped # for ATX headings-76 *)
        |> 
    ]
FormHeading[False, _, data_] := Splice[ StringSplit[ data, $LineRule ] ]

FormCodeLine[True, data_]:= $TokenData[ <| "Token" -> "CodeLine", "Data" -> data |> ]
FormCodeLine[False, data_]:= $TokenData[ <| "Token" -> "Line", "Data" -> data |> ]

(* ------------------------------- Line rules ------------------------------- *)

FaizonZaman`WLMarkdown`LineRules["CommonMark"] = {
    (* ------------------------------- Empty Line ------------------------------- *)
    $EmptyLineRule,
    (* ----------------------------- Horizontal Line ---------------------------- *)
    $ThematicBreakRule,
    (* ------------------------------ ATX Headings ------------------------------ *)
    (* Empty *)
    RegularExpression[ "^([#]+)[\\s\\t]*$" ] :> $TokenLevelData[ <| "Token" -> "Heading", "Marker"->"$1", "Level" -> StringLength["$1"], "Data" -> "" |> ],
    (* Non-Empty *)
    RegularExpression["^ {0,3}(#+)[ \\t]+(.*?)(#+)*$"] :> FormHeading[ ATXHeadingQ["$1"], "$2", "$0" ],
    (* -------------------------------- ListItems ------------------------------- *)
    (* UnorderedListItems *)
    (* RegularExpression[ "^(([\\s{2}\\t])*\)[-+*]\\s(.*\)$" ] :> $TokenLevelData[ <| "Token" -> "UnorderedListItem", "Level" -> GetIndentationLevel["$1"], "Data" -> "$3" |> ], *) (* Note that I had to escape the astrisk-closing paren in the regex because of linter issues *)
    RegularExpression["^( *)(\\t*)(([-+*])\\s(.*))$"] :> $TokenLevelData[<|"Token" -> "UnorderedListItem", "Marker" -> "$4", "Level" -> GetIndentationLevel["$1", "$2"], "Data" -> "$5"|>], (* Recommendation from ChatGPT; I've added the Marker key to the token, since different markers indicate different lists *)

    (* OrderedListItems *)
    RegularExpression[ "^( *)(\\t*)((\\d\\.)+\\d?) (.*)$" ] :> $TokenLevelData[ <| "Token" -> "OrderedListItem", "Marker" -> "$3" ,"Level" -> GetIndentationLevel["$1", "$2"], "Data" -> "$5" |> ],
    (* ---------------------------------- Code ---------------------------------- *)
    (* CodeLine *)
    (* RegularExpression[ "^( {4}|( {0,2}\\t))(.*\)$" ] :> $TokenData[ <| "Token" -> "CodeLine", "Data" -> "$3" |> ], *)
    RegularExpression[ "^( *)(\\t*)(.*)$" ] :> FormCodeLine[GetIndentationLevel["$1", "$2"] >= 4 , "$3"],
    (* CodeFence *)
    $CodeFenceRule,
    (* Quote *)
    RegularExpression[ "^(\\>)\\s(.*)" ] :> $TokenData[ <| "Token" -> "QuoteLine", "Data" -> "$2" |> ],
    (* Footnotes *)
    RegularExpression[ "^\\s*\\[(\\d+)\\]:\\s(.*)" ] :> $TokenData[ <| "Token" -> "Footnote", "Data" -> { "$1", "$2"} |> ],
    (* Line *)
    $LineRule
}

(* ------------------------------- Block rules ------------------------------ *)

FaizonZaman`WLMarkdown`BlockRules["CommonMark"] = {
    (* -------------------------------- Normalize ------------------------------- *)
    {seq:OrderlessPatternSequence[$TokenPattern["Line"], $TokenPattern["CodeLine"]]} :> Splice[{ seq } /. tk: $TokenPattern["CodeLine"] :> ChangeToken[tk, "Line"]],
    (* -------------------------------- CodeBlock ------------------------------- *)
    (* Fenced *)
    (* {$TokenPattern["EmptyLine"], block: Shortest[PatternSequence[$TokenPattern["CodeFence"], $TokenPattern["Line"].., $TokenPattern["CodeFence"]]], $TokenPattern["EmptyLine"]} :> Sequence[$Token[<| "Token" -> "EmptyLine" |> ], $TokenData[ <| "Token" -> "CodeBlock", "Data" -> {block} |>], $Token[<| "Token" -> "EmptyLine" |> ]], *)
    {block: Shortest[PatternSequence[$TokenPattern["CodeFence"], $TokenPattern["Line"].., $TokenPattern["CodeFence"]]]} :> $TokenData[ <| "Token" -> "CodeBlock", "Data" -> {block} |>],
    (* Indented *)
    (* {$TokenPattern["EmptyLine"], block: Shortest[$TokenPattern["CodeLine"]..], $TokenPattern["EmptyLine"]} :> Sequence[$Token[<| "Token" -> "EmptyLine" |> ], $TokenData[ <| "Token" -> "CodeBlock", "Data" -> {block} |>], $Token[<| "Token" -> "EmptyLine" |> ]], *)
    {block: ($TokenPattern["CodeLine"]..)} :> $TokenData[ <| "Token" -> "CodeBlock", "Data" -> {block} |>],
    
    (* ------------------------------- QuoteBlock ------------------------------- *)
    {$TokenPattern["EmptyLine"], block: Shortest[$TokenPattern["QuoteLine"]..], $TokenPattern["EmptyLine"]} :> Sequence[$Token[<| "Token" -> "EmptyLine" |> ], $TokenData[ <| "Token" -> "BlockQuote", "Data" -> {block} |>], $Token[<| "Token" -> "EmptyLine" |> ]],
    
    (* ---------------------------------- Table --------------------------------- *)
    {
        $TokenPattern["EmptyLine"],
        header : $TokenPattern["Line", "Data" -> h_ /; StringMatchQ[h, RegularExpression["(.+?[|])(.+?[|]?)*"]]],
        alignment : $TokenPattern["Line", "Data" -> a_ /; StringMatchQ[a, RegularExpression["(^\\s?:?-+:?\\s?[|])(\\s?:?-+:?\\s?[|]?)*"]]],
        rows: Shortest[$TokenPattern["Line"]..],
        $TokenPattern["EmptyLine"]
    } :> Sequence[ $Token[<|"Token" -> "EmptyLine"|>], $TokenData[<|"Token" -> "Table", "Data" -> {header, alignment, {rows}}|>], $Token[<| "Token" -> "EmptyLine" |>] ],
    
    (* ------------------------------ UnorderedList ----------------------------- *)
    (* {$TokenPattern["EmptyLine"], ulist: Shortest[$TokenPattern["UnorderedListItem"]..], $TokenPattern["EmptyLine"]} :> Sequence[$Token[<| "Token" -> "EmptyLine" |> ], $TokenData[ <| "Token" -> "UnorderedList", "Data" -> {ulist} |>], $Token[<| "Token" -> "EmptyLine" |> ]], *)
    {ulist: (Shortest[PatternSequence[$TokenPattern["UnorderedListItem"], $TokenPattern["UnorderedListItem"|"EmptyLine"|"Paragraph"]...]])} :> $TokenData[ <| "Token" -> "UnorderedList", "Data" -> {ulist} |>],
    
    (* ------------------------------- OrderedList ------------------------------ *)
    {$TokenPattern["EmptyLine"], olist: Shortest[$TokenPattern["OrderedListItem"]..], $TokenPattern["EmptyLine"]} :> Sequence[$Token[<| "Token" -> "EmptyLine" |> ], $TokenData[ <| "Token" -> "OrderedList", "Data" -> {olist} |>], $Token[<| "Token" -> "EmptyLine" |> ]],
    
    (* -------------------------------- Paragraph ------------------------------- *)
    {(* $TokenPattern["EmptyLine"],  *)p: ($TokenPattern["Line"]..)(* , $TokenPattern["EmptyLine"] *)} :> $TokenData[ <| "Token" -> "Paragraph", "Data" -> {p} |>]
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
