BeginPackage["FaizonZaman`WlMarkdown`ParseRules`"]
(* ParserRules for each flavor *)
(* Specify how to combine tokens... *)
Begin["`Private`"]

FaizonZaman`WLMarkdown`ParserRules["CommonMark"] = {
    (* TODO: CodeBlock *)
    (* TODO: Table *)
    (* TODO: List *)
    (* TODO: Hyperlinks *)
    (* TODO: Styles *)
}

(* TODO: DataParser *)
(* Parse Data inside lines and blocks *)

FaizonZaman`WLMarkdown`ParserRules[flavor_String] := (Message[ParserRules::invf, flavor];$Failed)

FaizonZaman`WLMarkdown`ParserRules::invf = "No parser rules defined for flavor \"``\""
End[]
EndPackage[]