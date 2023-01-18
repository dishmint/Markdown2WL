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

$MarkdownFlavor = "CommonMark";

ImportMarkdown[string_String, opts:OptionsPattern[{ImportMarkdown}]] := iImportMarkdown[string, opts]

ImportMarkdown[file_File?FileExistsQ, opts:OptionsPattern[{ImportMarkdown}]] := Module[
	{data = Import[file, "Text"]},
	iImportMarkdown[data, opts]
	]

iImportMarkdown[source_String, opts:OptionsPattern[{ImportMarkdown}]] :=
	Module[
		{lines = StringSplit[ source, "\n" ], tokens, parse},
		tokens = MarkdownLexer[ lines, opts ]
		(* parse = ParseMarkdown[tokens, opts]; *)
	]
SetAttributes[ MarkdownLexer, Listable ]
MarkdownLexer[ source_String, opts:OptionsPattern[{ImportMarkdown}] ] := Block[
	{ rules = MarkdownRules[$MarkdownFlavor] },
	StringReplace[ source, rules ]
	]

End[]

EndPackage[]
