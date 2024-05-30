BeginTestSection["Precedence"]
(* ------------------------------- Precedence ------------------------------- *)
(* -------------- https://spec.commonmark.org/0.30/#precedence -------------- *)
TestCreate[
	ImportMarkdown["- `one\n- two`\n"],
	{
		MarkdownElement[
			<|
				"Element" -> "UnorderedList",
				"Data" -> {
					MarkdownElement[
						<|
							"Element" -> "UnorderedListItem",
							"Level" -> 0,
							"Data" -> "`one"
						|>
					],
					MarkdownElement[
						<|
							"Element" -> "UnorderedListItem",
							"Level" -> 0,
							"Data" -> "two`"
						|>
					]
				}
			|>
		]
	},
	"TestID"->"Precedence-42"
	]
EndTestSection[]