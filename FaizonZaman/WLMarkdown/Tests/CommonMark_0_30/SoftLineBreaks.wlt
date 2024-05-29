BeginTestSection["SoftLineBreaks"]
(* ---------------------------- Soft line breaks ---------------------------- *)
(* ----------- https://spec.commonmark.org/0.30/#soft-line-breaks ----------- *)

TestCreate[
	ImportMarkdown["foo \n baz\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>], 
		MarkdownElement[
			<|
				"Element" -> "Paragraph",
				"Data" -> {
					MarkdownElement[<|"Element" -> "Line", "Data" -> "foo "|>],
					MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]
				}
			|>
		], 
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
	},
	"TestID"->"Soft line breaks-649"
	]

TestCreate[
	ImportMarkdown["foo\nbaz\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>], 
		MarkdownElement[
			<|
				"Element" -> "Paragraph",
				"Data" -> {
					MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>],
					MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]
				}
			|>
		], 
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
	},
	"TestID"->"Soft line breaks-648"
	]

EndTestSection[]