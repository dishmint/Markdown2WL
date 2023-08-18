BeginTestSection["CodeSpans"]
(* ------------------------------- Code Spans ------------------------------- *)
(* -------------- https://spec.commonmark.org/0.30/#code-spans -------------- *)

TestCreate[
	ImportMarkdown["` `` `\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Code spans-330"
	]

TestCreate[
	ImportMarkdown["`  ``  `\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>], "  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Code spans-331"
	]

TestCreate[
	ImportMarkdown["` `\n`  `\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "`", "Data" -> " "|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "`", "Data" -> "  "|>]}|>]},
	"TestID"->"Code spans-334"
	]

TestCreate[
	ImportMarkdown["` a`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "`", "Data" -> " a"|>]}|>]},
	"TestID"->"Code spans-332"
	]

TestCreate[
	ImportMarkdown["`<a href=\"`\">`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "`", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"`\""|>]}|>]}|>]},
	"TestID"->"Code spans-343"
	]

TestCreate[
	ImportMarkdown["<a href=\"`\">`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"`\""|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Code spans-344"
	]

TestCreate[
	ImportMarkdown["` b `\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "`", "Data" -> " b "|>]}|>]},
	"TestID"->"Code spans-333"
	]

TestCreate[
	ImportMarkdown["```foo``\n"],
	{MarkdownElement[<|"Element" -> "CodeFence", "Data" -> "foo``"|>]},
	"TestID"->"Code spans-347"
	]

TestCreate[
	ImportMarkdown["``\nfoo \n``\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>]}|>]},
	"TestID"->"Code spans-336"
	]

TestCreate[
	ImportMarkdown["`foo\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "foo"}|>]},
	"TestID"->"Code spans-348"
	]

TestCreate[
	ImportMarkdown["`foo`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "`", "Data" -> "foo"|>]}|>]},
	"TestID"->"Code spans-328"
	]

TestCreate[
	ImportMarkdown["*foo`*`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> {"foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Code spans-341"
	]

TestCreate[
	ImportMarkdown["`` foo ` bar ``\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>], " foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], " bar ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>]}|>]},
	"TestID"->"Code spans-329"
	]

TestCreate[
	ImportMarkdown["` foo `` bar `\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], " foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>], " bar ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Code spans-340"
	]

TestCreate[
	ImportMarkdown["``foo`bar``\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>]}|>]},
	"TestID"->"Code spans-339"
	]

TestCreate[
	ImportMarkdown["`foo\\`bar`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "foo\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Code spans-338"
	]

TestCreate[
	ImportMarkdown["`foo``bar``\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>]}|>]},
	"TestID"->"Code spans-349"
	]

TestCreate[
	ImportMarkdown["``\nfoo\nbar  \nbaz\n``\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar  "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>]}|>]},
	"TestID"->"Code spans-335"
	]

TestCreate[
	ImportMarkdown["`foo   bar \nbaz`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "foo   bar "}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"baz", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Code spans-337"
	]

TestCreate[
	ImportMarkdown["`<http://foo.bar.`baz>`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "`", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "http://foo.bar.`baz"|>]}|>]}|>]},
	"TestID"->"Code spans-345"
	]

TestCreate[
	ImportMarkdown["<http://foo.bar.`baz>`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "http://foo.bar.`baz"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Code spans-346"
	]

TestCreate[
	ImportMarkdown["[not a `link](/foo`)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"not a `link", "/foo`"}|>]}|>]},
	"TestID"->"Code spans-342"
	]
EndTestSection[]