BeginPackage["FaizonZaman`WLMarkdown`Utilities`"]

GetIndentationLevel::usage = "GetIndentationLevel[ ls ] Computes the indentation level from lead string ls."

Begin["`Private`"]
Options[GetIndentationLevel] = {
	"IndentLength" -> 2
};

GetIndentationLevel[ lead_String, opts:OptionsPattern[GetIndentationLevel] ] := Which[
    StringStartsQ[ RegularExpression[ "\\s+" ] ][ lead ], StringLength[ lead ] / OptionValue["IndentLength"],
    StringStartsQ[ RegularExpression[ "\\t+" ] ][ lead ], StringLength[ lead ],
    True, 0
]
End[]
EndPackage[]