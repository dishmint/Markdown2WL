BeginTestSection["BlankLines"]

(* ------------------------------- Blank lines ------------------------------ *)
(* -------------- https://spec.commonmark.org/0.30/#blank-lines ------------- *)

TestCreate[
	ImportMarkdown["  \n\naaa\n  \n\n# aaa\n\n  \n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "  "|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  "|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Heading", "Level" -> 1, "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  "|>]},
	"TestID"->"Blank lines-227"
	]
EndTestSection[]