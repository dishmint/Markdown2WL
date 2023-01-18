(* ::Package:: *)

BeginPackage["WLMarkdown`"]

(* Declare your package's public symbols here. *)

MarkdownProcess::usage = "MarkdownProcess[file.md] parses file.md into symbolic markdown"
MarkdownElement::usage = "Represents an element in Symbolic Markdown"
MarkdownToken::usage = "Represents a token of markdown"
TokenizeMarkdown::usage = "TokenizeMarkdown[mkds] tokenizes the markdown snippet mkds"

Begin["`Private`"]
Needs["WLMarkdown`MarkdownTokenize`"]
Needs["WLMarkdown`MarkdownParse`"]
Needs["WLMarkdown`MarkdownCompile`"]

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
