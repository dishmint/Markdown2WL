BeginTestSection["Images"]
(* --------------------------------- Images --------------------------------- *)
(* ---------------- https://spec.commonmark.org/0.30/#images ---------------- *)
TestCreate[
	ImportMarkdown["![foo][bar]\n\n[bar]: /url\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"!", MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo", "bar"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[bar]: /url"|>]},
	"TestID"->"Images-581"
	]

TestCreate[
	ImportMarkdown["![foo][bar]\n\n[BAR]: /url\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"!", MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo", "bar"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[BAR]: /url"|>]},
	"TestID"->"Images-582"
	]

TestCreate[
	ImportMarkdown["![foo *bar*][foobar]\n\n[FOOBAR]: train.jpg \"train & tracks\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"!", MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo *bar*", "foobar"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[FOOBAR]: train.jpg \"train & tracks\""|>]},
	"TestID"->"Images-576"
	]

TestCreate[
	ImportMarkdown["![foo *bar*][]\n\n[foo *bar*]: train.jpg \"train & tracks\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"![foo ", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>], "][]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"[foo ", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>], "]: train.jpg \"train & tracks\""}|>]},
	"TestID"->"Images-575"
	]

TestCreate[
	ImportMarkdown["![foo *bar*]\n\n[foo *bar*]: train.jpg \"train & tracks\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"![foo ", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>], "]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"[foo ", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>], "]: train.jpg \"train & tracks\""}|>]},
	"TestID"->"Images-572"
	]

TestCreate[
	ImportMarkdown["![*foo* bar][]\n\n[*foo* bar]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"![", MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], " bar][]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"[", MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], " bar]: /url \"title\""}|>]},
	"TestID"->"Images-584"
	]

TestCreate[
	ImportMarkdown["![*foo* bar]\n\n[*foo* bar]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"![", MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], " bar]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"[", MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], " bar]: /url \"title\""}|>]},
	"TestID"->"Images-588"
	]

TestCreate[
	ImportMarkdown["![foo ![bar](/url)](/url2)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Image", "Data" -> {"foo ![bar", "/url"}|>], "](/url2)"}|>]},
	"TestID"->"Images-573"
	]

TestCreate[
	ImportMarkdown["![foo [bar](/url)](/url2)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Image", "Data" -> {"foo [bar", "/url"}|>], "](/url2)"}|>]},
	"TestID"->"Images-574"
	]

TestCreate[
	ImportMarkdown["![[foo]]\n\n[[foo]]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "![[foo]]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[[foo]]: /url \"title\""|>]},
	"TestID"->"Images-589"
	]

TestCreate[
	ImportMarkdown["!\\[foo]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"!", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\["|>], "foo]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Images-591"
	]

TestCreate[
	ImportMarkdown["\\![foo]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "\\![foo]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Images-592"
	]

TestCreate[
	ImportMarkdown["![foo] \n[]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "![foo] "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Images-586"
	]

TestCreate[
	ImportMarkdown["![foo][]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "![foo][]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Images-583"
	]

TestCreate[
	ImportMarkdown["![Foo][]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "![Foo][]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Images-585"
	]

TestCreate[
	ImportMarkdown["![foo]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "![foo]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Images-587"
	]

TestCreate[
	ImportMarkdown["![Foo]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "![Foo]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Images-590"
	]

TestCreate[
	ImportMarkdown["![foo](train.jpg)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Image", "Data" -> {"foo", "train.jpg"}|>]}|>]},
	"TestID"->"Images-577"
	]

TestCreate[
	ImportMarkdown["![foo](<url>)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Image", "Data" -> {"foo", "<url>"}|>]}|>]},
	"TestID"->"Images-579"
	]

TestCreate[
	ImportMarkdown["![foo](/url \"title\")\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Image", "Data" -> {"foo", "/url \"title\""}|>]}|>]},
	"TestID"->"Images-571"
	]

TestCreate[
	ImportMarkdown["My ![foo bar](/path/to/train.jpg  \"title\"   )\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"My ", MarkdownElement[<|"Element" -> "Image", "Data" -> {"foo bar", "/path/to/train.jpg  \"title\"   "}|>]}|>]},
	"TestID"->"Images-578"
	]

TestCreate[
	ImportMarkdown["![](/url)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "![](/url)"|>]},
	"TestID"->"Images-580"
	]

EndTestSection[]