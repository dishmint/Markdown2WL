BeginTestSection["Images"]
(* --------------------------------- Images --------------------------------- *)
(* ---------------- https://spec.commonmark.org/0.30/#images ---------------- *)
VerificationTest[
	ImportMarkdown["![foo][bar]\n\n[bar]: /url\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"!", MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo", "bar"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[bar]: /url"|>]},
	"TestID"->"Images-581"
	]

VerificationTest[
	ImportMarkdown["![foo][bar]\n\n[BAR]: /url\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"!", MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo", "bar"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[BAR]: /url"|>]},
	"TestID"->"Images-582"
	]

VerificationTest[
	ImportMarkdown["![foo *bar*][foobar]\n\n[FOOBAR]: train.jpg \"train & tracks\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"!", MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo *bar*", "foobar"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[FOOBAR]: train.jpg \"train & tracks\""|>]},
	"TestID"->"Images-576"
	]

VerificationTest[
	ImportMarkdown["![foo *bar*][]\n\n[foo *bar*]: train.jpg \"train & tracks\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"![foo ", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>], "][]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"[foo ", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>], "]: train.jpg \"train & tracks\""}|>]},
	"TestID"->"Images-575"
	]

VerificationTest[
	ImportMarkdown["![foo *bar*]\n\n[foo *bar*]: train.jpg \"train & tracks\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"![foo ", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>], "]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"[foo ", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>], "]: train.jpg \"train & tracks\""}|>]},
	"TestID"->"Images-572"
	]

VerificationTest[
	ImportMarkdown["![*foo* bar][]\n\n[*foo* bar]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"![", MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], " bar][]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"[", MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], " bar]: /url \"title\""}|>]},
	"TestID"->"Images-584"
	]

VerificationTest[
	ImportMarkdown["![*foo* bar]\n\n[*foo* bar]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"![", MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], " bar]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"[", MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], " bar]: /url \"title\""}|>]},
	"TestID"->"Images-588"
	]

VerificationTest[
	ImportMarkdown["![foo ![bar](/url)](/url2)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Image", "Data" -> {"foo ![bar", "/url"}|>], "](/url2)"}|>]},
	"TestID"->"Images-573"
	]

VerificationTest[
	ImportMarkdown["![foo [bar](/url)](/url2)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Image", "Data" -> {"foo [bar", "/url"}|>], "](/url2)"}|>]},
	"TestID"->"Images-574"
	]

VerificationTest[
	ImportMarkdown["![[foo]]\n\n[[foo]]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "![[foo]]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[[foo]]: /url \"title\""|>]},
	"TestID"->"Images-589"
	]

VerificationTest[
	ImportMarkdown["!\\[foo]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"!", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\["|>], "foo]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Images-591"
	]

VerificationTest[
	ImportMarkdown["\\![foo]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "\\![foo]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Images-592"
	]

VerificationTest[
	ImportMarkdown["![foo] \n[]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "![foo] "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Images-586"
	]

VerificationTest[
	ImportMarkdown["![foo][]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "![foo][]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Images-583"
	]

VerificationTest[
	ImportMarkdown["![Foo][]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "![Foo][]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Images-585"
	]

VerificationTest[
	ImportMarkdown["![foo]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "![foo]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Images-587"
	]

VerificationTest[
	ImportMarkdown["![Foo]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "![Foo]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Images-590"
	]

VerificationTest[
	ImportMarkdown["![foo](train.jpg)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Image", "Data" -> {"foo", "train.jpg"}|>]}|>]},
	"TestID"->"Images-577"
	]

VerificationTest[
	ImportMarkdown["![foo](<url>)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Image", "Data" -> {"foo", "<url>"}|>]}|>]},
	"TestID"->"Images-579"
	]

VerificationTest[
	ImportMarkdown["![foo](/url \"title\")\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Image", "Data" -> {"foo", "/url \"title\""}|>]}|>]},
	"TestID"->"Images-571"
	]

VerificationTest[
	ImportMarkdown["My ![foo bar](/path/to/train.jpg  \"title\"   )\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"My ", MarkdownElement[<|"Element" -> "Image", "Data" -> {"foo bar", "/path/to/train.jpg  \"title\"   "}|>]}|>]},
	"TestID"->"Images-578"
	]

VerificationTest[
	ImportMarkdown["![](/url)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "![](/url)"|>]},
	"TestID"->"Images-580"
	]

EndTestSection[]