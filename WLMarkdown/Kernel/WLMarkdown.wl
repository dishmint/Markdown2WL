(* ::Package:: *)

BeginPackage["WLMarkdown`"]

(* Declare your package's public symbols here. *)

MarkdownParse::usage = "MarkdownParse[file.md] parses file.md into symbolic markdown"
MarkdownElement::usage = "Represents an element in Symbolic Markdown"

Begin["`Private`"]
Needs["MarkdownTokenize`"]
Needs["MarkdownParse`"]
Needs["MarkdownCompile`"]

(* Parse *)
Options[MarkdownProcess] = {
	"Flavor" -> "CommonMark"
};

MarkdownProcess[string_String, opts:OptionsPattern[{MarkdownProcess}]] := MarkdownProcessor[string, opts]

MarkdownProcess[file_File?FileExistsQ, opts:OptionsPattern[{MarkdownProcess}]] := Module[
	{data = Import[file, "Text"]},
	MarkdownProcessor[data, opts]
	]

MarkdownProcessor[source_, form_String:"SymbolicMarkdown", opts:OptionsPattern[{MarkdownProcess}]] :=
	Module[
		{tokens, parse},
		(* 1 — Tokenize source *)
		tokens = TokenizeMarkdown[data];
		(* 2 — Parse tokens *)
		parse = ParseMarkdown[tokens];
		(* 3 — Compile parse to Symbolic Markdown *)
		CompileMarkdown[parse, form, opts]
	]

End[] (* End `Private` *)

EndPackage[]
