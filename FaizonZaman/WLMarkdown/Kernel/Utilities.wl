BeginPackage["FaizonZaman`WLMarkdown`Utilities`"]

GetIndentationLevel::usage = "GetIndentationLevel[ ls ] Computes the indentation level from lead string ls."

Begin["`Private`"]
Options[GetIndentationLevel] = {
	"IndentLength" -> 2
};

GetIndentationLevel[ lead_String, opts:OptionsPattern[GetIndentationLevel] ] := Which[
    StringMatchQ[ RegularExpression[ "(\\s{2})+" ] ][ lead ], StringLength[ lead ] / OptionValue["IndentLength"],
    StringMatchQ[ RegularExpression[ "\\t+" ] ][ lead ], StringLength[ lead ],
    True, 0
]
End[]
EndPackage[]