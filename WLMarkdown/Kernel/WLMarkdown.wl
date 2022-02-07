BeginPackage["WLMarkdown`"]

(* Declare your package's public symbols here. *)

MarkdownParse::usage = "MarkdownParse[file.md] parses the markdown file into symbolic markdown"
MarkdownElement::usage = "Represents an element in Symbolic Markdown"
Begin["`Private`"]

(* Define your public and private symbols here. *)

MarkdownParse[file_?FileExistsQ] := MarkdownParser[file]


End[] (* End `Private` *)

EndPackage[]
