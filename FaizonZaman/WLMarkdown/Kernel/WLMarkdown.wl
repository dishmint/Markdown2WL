(* ::Package:: *)

BeginPackage["FaizonZaman`WLMarkdown`"]

(* Declare your package's public symbols here. *)

ImportMarkdown::usage = "ImportMarkdown[s] imports string s into symbolic markdown\nImportMarkdown[f] imports file f into symbolic markdown"
MarkdownToken::usage = "Represents a lexed Markdown token"
MarkdownElement::usage = "Represents a symbolic Markdown element"

Begin["`Private`"]

Needs["FaizonZaman`WLMarkdown`MarkdownRules`"]

(* ImportMarkdown *)
Options[ImportMarkdown] = {
	"Flavor" -> Automatic
};

ImportMarkdown[string_String, opts:OptionsPattern[ImportMarkdown]] := iImportMarkdown[string, opts]

ImportMarkdown[file_File?FileExistsQ, opts:OptionsPattern[ImportMarkdown]] := Module[
	{data = Import[file, "Text"]},
	iImportMarkdown[data, opts]
	]

iImportMarkdown[source_String, opts:OptionsPattern[ImportMarkdown]] :=
	Module[
		{
			lines = StringSplit[ source, "\n" ], tokens(* , parse *),
			flavor = Replace[OptionValue["Flavor"], Automatic -> "CommonMark"]
			},
		Enclose[
			Confirm[ rules = MarkdownRules[ flavor ], StringTemplate[ MarkdownRules::invf ][ flavor ] ];
			tokens = MarkdownLexer[ lines, rules ]
			(* parse = ParseMarkdown[tokens, opts]; *)
		]
	]

MarkdownLexer[ source_String, rules_List ] := Splice[ StringSplit[ source, rules ] ]
MarkdownLexer[ source_List, rules_List ] := Map[ MarkdownLexer[ #, rules ]&, source ]

End[]

EndPackage[]
