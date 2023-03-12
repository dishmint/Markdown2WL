BeginPackage["FaizonZaman`WLMarkdown`Parser`"]
Begin["`Private`"]
Needs["FaizonZaman`WLMarkdown`ElementRules`"]

$NonDelimiterPattern = FaizonZaman`WlMarkdown`MarkdownElement[KeyValuePattern[{"Element" -> Except["Delimiter"]}]];
$DelimiterPattern = FaizonZaman`WlMarkdown`MarkdownElement[KeyValuePattern[{"Element" -> "Delimiter", "Data" -> s_}]];

MDElementFreeQ = ( expr |-> FreeQ[_FaizonZaman`WLMarkdown`MarkdownElement][expr])
MDElementPresentQ = ( expr |-> Not@*MDElementFreeQ@expr)
MDElementDataContainsDelimiterQ = ( expr |-> Not@*FreeQ[$DelimiterPattern]@expr)
ContainsOnlyDelimiterElementQ   = ( expr |-> Through[And[MDElementDataContainsDelimiterQ, FreeQ[$NonDelimiterPattern][expr]]])
(* DelimiterParser *)

DelimiterParser[expr_Association] := With[{data = expr["Data"]}, ReplacePart[expr, Key["Data"] :> FixedPoint[ iDelimiterParser, data ]]]
iDelimiterParser[expr_List /; ContainsOnlyDelimiterElementQ] := Replace[
    expr, 
    {before___, $DelimiterPattern, t__, $DelimiterPattern, after___} :> {before, $ElementData[<| "Element" -> s, "Data" -> {t}|> ], after}
    ]
iDelimiterParser[expr_List /; MDElementPresentQ[expr]] := SubsetMap[
    Map[Replace[#, x_List :> iDelimiterParser[x], Infinity] &],
    expr,
    Position[expr, _FaizonZaman`WLMarkdown`MarkdownElement]
    ] 



FaizonZaman`WLMarkdown`MarkdownParser[ token_FaizonZaman`WLMarkdown`MarkdownToken, rules_List ] := FaizonZaman`WLMarkdown`MarkdownParser[ { token }, rules ]
FaizonZaman`WLMarkdown`MarkdownParser[ tokens:List[__FaizonZaman`WLMarkdown`MarkdownToken], rules_List ] := Module[
    { elements = Replace[tokens, rules, Infinity], delimiterPositions },
    (* elements *)
    delimiterPositions = Position[elements, KeyValuePattern[{"Data" -> data_}] /; MDElementDataContainsDelimiterQ@data];
    MapAt[ DelimiterParser, elements, delimiterPositions ]
    (* MapAt[ FixedPoint[ DelimiterParser, # ]&, elements, delimiterPositions ] *)
    (* MapAt[ DelimiterParser, elements, delimiterPositions ] *)
]

End[]
EndPackage[]