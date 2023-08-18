BeginTestSection["Autolinks"]
(* -------------------------------- Autolinks ------------------------------- *)
(* --------------- https://spec.commonmark.org/0.30/#autolinks -------------- *)
TestCreate[
	ImportMarkdown["<>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<>"|>]},
	"TestID"->"Autolinks-606"
	]

TestCreate[
	ImportMarkdown["<a+b+c:d>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a+b+c:d"|>]}|>]},
	"TestID"->"Autolinks-597"
	]

TestCreate[
	ImportMarkdown["<foo.bar.baz>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "foo.bar.baz"|>]}|>]},
	"TestID"->"Autolinks-609"
	]

TestCreate[
	ImportMarkdown["<foo\\+@bar.example.com>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "foo\\+@bar.example.com"|>]}|>]},
	"TestID"->"Autolinks-605"
	]

TestCreate[
	ImportMarkdown["<foo@bar.example.com>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "foo@bar.example.com"|>]}|>]},
	"TestID"->"Autolinks-603"
	]

TestCreate[
	ImportMarkdown["foo@bar.example.com\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo@bar.example.com"|>]},
	"TestID"->"Autolinks-611"
	]

TestCreate[
	ImportMarkdown["<foo+special@Bar.baz-bar0.com>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "foo+special@Bar.baz-bar0.com"|>]}|>]},
	"TestID"->"Autolinks-604"
	]

TestCreate[
	ImportMarkdown["<http://../>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "http://../"|>]}|>]},
	"TestID"->"Autolinks-599"
	]

TestCreate[
	ImportMarkdown["<http://example.com/\\[\\>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "http://example.com/\\[\\"|>]}|>]},
	"TestID"->"Autolinks-602"
	]

TestCreate[
	ImportMarkdown["http://example.com\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "http://example.com"|>]},
	"TestID"->"Autolinks-610"
	]

TestCreate[
	ImportMarkdown["< http://foo.bar >\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> " http://foo.bar "|>]}|>]},
	"TestID"->"Autolinks-607"
	]

TestCreate[
	ImportMarkdown["<http://foo.bar.baz>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "http://foo.bar.baz"|>]}|>]},
	"TestID"->"Autolinks-593"
	]

TestCreate[
	ImportMarkdown["<http://foo.bar/baz bim>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "http://foo.bar/baz bim"|>]}|>]},
	"TestID"->"Autolinks-601"
	]

TestCreate[
	ImportMarkdown["<http://foo.bar.baz/test?q=hello&id=22&boolean>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "http://foo.bar.baz/test?q=hello&id=22&boolean"|>]}|>]},
	"TestID"->"Autolinks-594"
	]

TestCreate[
	ImportMarkdown["<irc://foo.bar:2233/baz>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "irc://foo.bar:2233/baz"|>]}|>]},
	"TestID"->"Autolinks-595"
	]

TestCreate[
	ImportMarkdown["<localhost:5001/foo>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "localhost:5001/foo"|>]}|>]},
	"TestID"->"Autolinks-600"
	]

TestCreate[
	ImportMarkdown["<m:abc>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "m:abc"|>]}|>]},
	"TestID"->"Autolinks-608"
	]

TestCreate[
	ImportMarkdown["<made-up-scheme://foo,bar>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "made-up-scheme://foo,bar"|>]}|>]},
	"TestID"->"Autolinks-598"
	]

TestCreate[
	ImportMarkdown["<MAILTO:FOO@BAR.BAZ>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "MAILTO:FOO@BAR.BAZ"|>]}|>]},
	"TestID"->"Autolinks-596"
	]
EndTestSection[]