BeginTestSection["Inlines"]
(* --------------------------------- Inlines -------------------------------- *)
(* ---------------- https://spec.commonmark.org/0.30/#inlines --------------- *)

TestCreate[
	ImportMarkdown["`hi`lo`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "hi", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "lo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Inlines-327"
	]

EndTestSection[]