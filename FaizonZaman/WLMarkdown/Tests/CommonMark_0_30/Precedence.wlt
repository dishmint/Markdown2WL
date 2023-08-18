BeginTestSection["Precedence"]
(* ------------------------------- Precedence ------------------------------- *)
(* -------------- https://spec.commonmark.org/0.30/#precedence -------------- *)
TestCreate[
	ImportMarkdown["- `one\n- two`\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "one"}|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {"two", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Precedence-42"
	]
EndTestSection[]