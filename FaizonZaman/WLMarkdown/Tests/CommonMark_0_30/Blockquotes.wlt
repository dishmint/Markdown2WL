BeginTestSection["BlockQuotes"]
(* ------------------------------- Blockquotes ------------------------------ *)
(* ------------- https://spec.commonmark.org/0.30/#block-quotes ------------- *)

VerificationTest[
	ImportMarkdown[">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> ">"|>]},
	"TestID"->"Block quotes-239"
	]

VerificationTest[
	ImportMarkdown[">\n>  \n> \n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> ">"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> " "|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> {}|>]},
	"TestID"->"Block quotes-240"
	]

VerificationTest[
	ImportMarkdown["> aaa\n***\n> bbb\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "bbb"|>]},
	"TestID"->"Block quotes-246"
	]

VerificationTest[
	ImportMarkdown["> bar\n>\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> ">"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Block quotes-249"
	]

VerificationTest[
	ImportMarkdown["> bar\n\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Block quotes-248"
	]

VerificationTest[
	ImportMarkdown["> bar\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Block quotes-247"
	]

VerificationTest[
	ImportMarkdown["> bar\nbaz\n> foo\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "foo"|>]},
	"TestID"->"Block quotes-233"
	]

VerificationTest[
	ImportMarkdown[">     code\n\n>    not code\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "    code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "   not code"|>]},
	"TestID"->"Block quotes-252"
	]

VerificationTest[
	ImportMarkdown["> ```\nfoo\n```\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>]},
	"TestID"->"Block quotes-237"
	]

VerificationTest[
	ImportMarkdown[">\n> foo\n>  \n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> ">"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> " "|>]},
	"TestID"->"Block quotes-241"
	]

VerificationTest[
	ImportMarkdown["> foo\n---\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>]},
	"TestID"->"Block quotes-234"
	]

VerificationTest[
	ImportMarkdown[">     foo\n    bar\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "    foo"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "bar"|>]},
	"TestID"->"Block quotes-236"
	]

VerificationTest[
	ImportMarkdown["> > > foo\nbar\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "> > foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>]},
	"TestID"->"Block quotes-250"
	]

VerificationTest[
	ImportMarkdown["> - foo\n- bar\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "- foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>]},
	"TestID"->"Block quotes-235"
	]

VerificationTest[
	ImportMarkdown["> foo\n    - bar\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 2, "Data" -> "bar"|>]},
	"TestID"->"Block quotes-238"
	]

VerificationTest[
	ImportMarkdown["> foo\n>\n> bar\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> ">"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "bar"|>]},
	"TestID"->"Block quotes-244"
	]

VerificationTest[
	ImportMarkdown["> foo\n\n> bar\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "bar"|>]},
	"TestID"->"Block quotes-242"
	]

VerificationTest[
	ImportMarkdown["> foo\n> bar\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "bar"|>]},
	"TestID"->"Block quotes-243"
	]

VerificationTest[
	ImportMarkdown["foo\n> bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "bar"|>]},
	"TestID"->"Block quotes-245"
	]

VerificationTest[
	ImportMarkdown["    > # Foo\n    > bar\n    > baz\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "> # Foo"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "> bar"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "> baz"|>]},
	"TestID"->"Block quotes-231"
	]

VerificationTest[
	ImportMarkdown["   > # Foo\n   > bar\n > baz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "   > # Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   > bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> " > baz"|>]},
	"TestID"->"Block quotes-230"
	]

VerificationTest[
	ImportMarkdown[">>> foo\n> bar\n>>baz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> ">>> foo"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> ">>baz"|>]},
	"TestID"->"Block quotes-251"
	]

VerificationTest[
	ImportMarkdown["> # Foo\n> bar\n> baz\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "# Foo"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "baz"|>]},
	"TestID"->"Block quotes-228"
	]

VerificationTest[
	ImportMarkdown["> # Foo\n> bar\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "# Foo"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Block quotes-232"
	]

VerificationTest[
	ImportMarkdown["># Foo\n>bar\n> baz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "># Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> ">bar"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "baz"|>]},
	"TestID"->"Block quotes-229"
	]
EndTestSection[]