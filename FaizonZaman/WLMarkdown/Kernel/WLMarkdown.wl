(* ::Package:: *)

BeginPackage["FaizonZaman`WLMarkdown`"]

(* Declare your package's public symbols here. *)

ImportMarkdown::usage = "ImportMarkdown[s] imports string s into symbolic markdown\nImportMarkdown[f] imports file f into symbolic markdown"
TokenRules::usage = "TokenRules[f] gives the rules for Markdown flavor f"
MarkdownLexer::usage = "MarkdownLexer[s,r] lexes the string s with rules r\nMarkdownLexer[ls, r] lexes the list of strings ls with rules r"
MarkdownToken::usage = "Represents a lexed Markdown token"
MarkdownElement::usage = "Represents a symbolic Markdown element"

Begin["`Private`"]
Needs["FaizonZaman`WLMarkdown`Utilities`"]
Needs["FaizonZaman`WLMarkdown`TokenRules`"]

(* ImportMarkdown *)
Options[ImportMarkdown] = {
	"Flavor" -> Automatic
};

ImportMarkdown[ string_String, opts:OptionsPattern[ ImportMarkdown ] ] := iImportMarkdown[ string, opts ]

ImportMarkdown[ file_File?FileExistsQ, opts:OptionsPattern[ ImportMarkdown ] ] := Module[
	{data = Import[ file, "Text" ]},
	iImportMarkdown[ data, opts ]
	]

iImportMarkdown[ source_String, opts:OptionsPattern[ ImportMarkdown ] ] :=
	Module[
		{
			lines = StringSplit[ source, "\n" ], tokens(* , parse *),
			flavor = Replace[ OptionValue[ "Flavor" ], Automatic -> "CommonMark" ]
			},
		Enclose[
			Confirm[ rules = TokenRules[ flavor ], StringTemplate[ TokenRules::invf ][ flavor ] ];
			tokens = MarkdownLexer[ lines, rules ]
			(* parse = MarkdownParser[tokens, opts]; *)
		]
	]

MarkdownLexer[ line_String, rules_List ] := iMarkdownLexer[ line, rules ]
MarkdownLexer[ lines_List, rules_List ] := Map[ iMarkdownLexer[ #, rules ]&, lines ]

iMarkdownLexer[ line_String, rules_List ] := Splice[ StringSplit[ line, rules ] ]

End[]

EndPackage[]
