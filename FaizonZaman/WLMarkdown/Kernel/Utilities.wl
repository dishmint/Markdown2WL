BeginPackage["FaizonZaman`WLMarkdown`Utilities`"]

GetIndentationLevel::usage = "GetIndentationLevel[ ls ] Computes the indentation level from lead string ls."

Begin["`Private`"]
Options[GetIndentationLevel] = {
	"IndentLength" -> 2
};
(* Deprecated *)
(* 
GetIndentationLevel[ lead_String, opts:OptionsPattern[GetIndentationLevel] ] := Which[
    StringMatchQ[ RegularExpression[ "(\\s{2})+" ] ][ lead ], StringLength[ lead ] / OptionValue["IndentLength"],
    StringMatchQ[ RegularExpression[ "\\t+" ] ][ lead ], StringLength[ lead ],
    True, 0
] *)

GetIndentationLevel[leadSpaces_String, "", opts:OptionsPattern[GetIndentationLevel]] := (StringLength[leadSpaces] / OptionValue["IndentLength"])
GetIndentationLevel["", leadTabs_String, opts:OptionsPattern[GetIndentationLevel]] := StringLength[leadTabs]
GetIndentationLevel[leadSpaces_, leadTabs_String, opts:OptionsPattern[GetIndentationLevel]] := Floor[StringLength[leadSpaces] + (StringLength[leadTabs] / 4)]
End[]
EndPackage[]