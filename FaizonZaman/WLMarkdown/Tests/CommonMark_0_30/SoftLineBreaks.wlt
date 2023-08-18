BeginTestSection["SoftLineBreaks"]
(* ---------------------------- Soft line breaks ---------------------------- *)
(* ----------- https://spec.commonmark.org/0.30/#soft-line-breaks ----------- *)

TestCreate[
	ImportMarkdown["foo \n baz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> " baz"|>]},
	"TestID"->"Soft line breaks-649"
	]

TestCreate[
	ImportMarkdown["foo\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Soft line breaks-648"
	]

EndTestSection[]