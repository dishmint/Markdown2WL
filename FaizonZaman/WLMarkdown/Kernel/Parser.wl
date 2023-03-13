BeginPackage["FaizonZaman`WLMarkdown`Parser`"]
Begin["`Private`"]
Needs["FaizonZaman`WLMarkdown`ElementRules`"]

(* DelimiterParser *)
FlatMDElementsQ[expr_] := Block[
    {patt = FaizonZaman`WLMarkdown`MarkdownElement[KeyValuePattern[{"Element" -> "Delimiter"}]], exprlvl1 = Level[expr, 1]},
    aop1 = MemberQ[ exprlvl1, patt];
    aop2 = Count[ exprlvl1, patt] // EvenQ;
    And[ aop1, aop2 ]
    ]

DelimiterParser[expr_List] := FixedPoint[ EchoEvaluation@*iDelimiterParser, expr ]
iDelimiterParser[s_String] := s
iDelimiterParser[{ s_String }] := s
iDelimiterParser[expr_List /; FlatMDElementsQ[expr]] := Replace[
    expr, 
    {before___, FaizonZaman`WLMarkdown`MarkdownElement[KeyValuePattern[{"Element" -> "Delimiter", "Data" -> s_}]], t__, FaizonZaman`WLMarkdown`MarkdownElement[KeyValuePattern[{"Element" -> "Delimiter", "Data" -> s_}]], after___} :> {before, $ElementData[<| "Element" -> s, "Data" -> iDelimiterParser[ {t} ]|> ], after}
    ]
iDelimiterParser[expr_List /; Not@FlatMDElementsQ[expr]] := SubsetMap[
    Map[Replace[#, x_List :> iDelimiterParser[x], Infinity] &],
    expr,
    Position[expr, KeyValuePattern[{"Data" -> _List}]]
    ]
iDelimiterParser[expr_List /; FreeQ[FaizonZaman`WLMarkdown`MarkdownElement[KeyValuePattern[{"Element" -> "Delimiter"}]]]] := expr

FaizonZaman`WLMarkdown`MarkdownParser[ token_FaizonZaman`WLMarkdown`MarkdownToken, rules_List ] := FaizonZaman`WLMarkdown`MarkdownParser[ { token }, rules ]
FaizonZaman`WLMarkdown`MarkdownParser[ tokens:List[__FaizonZaman`WLMarkdown`MarkdownToken], rules_List ] := Module[
    { elements = Replace[tokens, rules, Infinity] },
    MapAt[
        ReplacePart[#, Key["Data"] -> DelimiterParser[#["Data"]]] &, elements,
        Position[elements, KeyValuePattern[{"Data" -> _List}]]
        ]
]

End[]
EndPackage[]