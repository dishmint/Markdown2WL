BeginTestSection["CommonMark_0_30"]

(* -------------------------------------------------------------------------- *)
(*     CommonMark v0.30 Tests "https://spec.commonmark.org/0.30/spec.json"    *)
(* -------------------------------------------------------------------------- *)

(* -------------------------------- Autolinks ------------------------------- *)
VerificationTest[
	ImportMarkdown["<>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<>"|>]},
	"TestID"->"Autolinks-606"
	]

VerificationTest[
	ImportMarkdown["<a+b+c:d>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a+b+c:d"|>]}|>]},
	"TestID"->"Autolinks-597"
	]

VerificationTest[
	ImportMarkdown["<foo.bar.baz>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "foo.bar.baz"|>]}|>]},
	"TestID"->"Autolinks-609"
	]

VerificationTest[
	ImportMarkdown["<foo\\+@bar.example.com>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "foo\\+@bar.example.com"|>]}|>]},
	"TestID"->"Autolinks-605"
	]

VerificationTest[
	ImportMarkdown["<foo@bar.example.com>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "foo@bar.example.com"|>]}|>]},
	"TestID"->"Autolinks-603"
	]

VerificationTest[
	ImportMarkdown["foo@bar.example.com\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo@bar.example.com"|>]},
	"TestID"->"Autolinks-611"
	]

VerificationTest[
	ImportMarkdown["<foo+special@Bar.baz-bar0.com>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "foo+special@Bar.baz-bar0.com"|>]}|>]},
	"TestID"->"Autolinks-604"
	]

VerificationTest[
	ImportMarkdown["<http://../>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "http://../"|>]}|>]},
	"TestID"->"Autolinks-599"
	]

VerificationTest[
	ImportMarkdown["<http://example.com/\\[\\>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "http://example.com/\\[\\"|>]}|>]},
	"TestID"->"Autolinks-602"
	]

VerificationTest[
	ImportMarkdown["http://example.com\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "http://example.com"|>]},
	"TestID"->"Autolinks-610"
	]

VerificationTest[
	ImportMarkdown["< http://foo.bar >\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> " http://foo.bar "|>]}|>]},
	"TestID"->"Autolinks-607"
	]

VerificationTest[
	ImportMarkdown["<http://foo.bar.baz>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "http://foo.bar.baz"|>]}|>]},
	"TestID"->"Autolinks-593"
	]

VerificationTest[
	ImportMarkdown["<http://foo.bar/baz bim>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "http://foo.bar/baz bim"|>]}|>]},
	"TestID"->"Autolinks-601"
	]

VerificationTest[
	ImportMarkdown["<http://foo.bar.baz/test?q=hello&id=22&boolean>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "http://foo.bar.baz/test?q=hello&id=22&boolean"|>]}|>]},
	"TestID"->"Autolinks-594"
	]

VerificationTest[
	ImportMarkdown["<irc://foo.bar:2233/baz>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "irc://foo.bar:2233/baz"|>]}|>]},
	"TestID"->"Autolinks-595"
	]

VerificationTest[
	ImportMarkdown["<localhost:5001/foo>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "localhost:5001/foo"|>]}|>]},
	"TestID"->"Autolinks-600"
	]

VerificationTest[
	ImportMarkdown["<m:abc>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "m:abc"|>]}|>]},
	"TestID"->"Autolinks-608"
	]

VerificationTest[
	ImportMarkdown["<made-up-scheme://foo,bar>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "made-up-scheme://foo,bar"|>]}|>]},
	"TestID"->"Autolinks-598"
	]

VerificationTest[
	ImportMarkdown["<MAILTO:FOO@BAR.BAZ>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "MAILTO:FOO@BAR.BAZ"|>]}|>]},
	"TestID"->"Autolinks-596"
	]


(* ---------------------------- Backslash Escapes --------------------------- *)
VerificationTest[
	ImportMarkdown["    \\[\\]\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\["|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\]"|>]}|>]},
	"TestID"->"Backslash escapes-18"
	]

VerificationTest[
	ImportMarkdown["`` \\[\\` ``\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "``", "Data" -> {" ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\["|>], "\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], " "}|>]}|>]},
	"TestID"->"Backslash escapes-17"
	]

VerificationTest[
	ImportMarkdown["~~~\n\\[\\]\n~~~\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "~~~"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\["|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\]"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "~~~"|>]},
	"TestID"->"Backslash escapes-19"
	]

VerificationTest[
	ImportMarkdown["\\\t\\A\\a\\ \\3\\\[CurlyPhi]\\<<\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "\\\t\\A\\a\\ \\3\\\[CurlyPhi]\\<<"|>]},
	"TestID"->"Backslash escapes-13"
	]

VerificationTest[
	ImportMarkdown["<a href=\"/bar\\/)\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"/bar\\/)\""|>]}|>]},
	"TestID"->"Backslash escapes-21"
	]

VerificationTest[
	ImportMarkdown["\\\\*emphasis*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"\\\\", MarkdownElement[<|"Element" -> "*", "Data" -> "emphasis"|>]}|>]},
	"TestID"->"Backslash escapes-15"
	]

VerificationTest[
	ImportMarkdown["foo\\\nbar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo\\"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>]},
	"TestID"->"Backslash escapes-16"
	]

VerificationTest[
	ImportMarkdown["``` foo\\+bar\nfoo\n```\n"],
	{MarkdownElement[<|"Element" -> "CodeFence", "Data" -> " foo\\+bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>]},
	"TestID"->"Backslash escapes-24"
	]

VerificationTest[
	ImportMarkdown["[foo](/bar\\* \"ti\\*tle\")\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"foo", "/bar\\* \"ti\\*tle\""}|>]}|>]},
	"TestID"->"Backslash escapes-22"
	]

VerificationTest[
	ImportMarkdown["[foo]\n\n[foo]: /bar\\* \"ti\\*tle\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"[foo]: /bar\\", MarkdownElement[<|"Element" -> "*", "Data" -> " \"ti\\"|>], "tle\""}|>]},
	"TestID"->"Backslash escapes-23"
	]

VerificationTest[
	ImportMarkdown["<http://example.com?find=\\*>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "http://example.com?find=\\*"|>]}|>]},
	"TestID"->"Backslash escapes-20"
	]

VerificationTest[
	ImportMarkdown["\\*not emphasized*\n\\<br/> not a tag\n\\[not a link](/foo)\n\\`not code`\n1\\. not a list\n\\* not a list\n\\# not a heading\n\\[foo]: /url \"not a reference\"\n\\&ouml; not a character entity\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"\\", MarkdownElement[<|"Element" -> "*", "Data" -> "not emphasized"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"\\", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "br/"|>], " not a tag"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"\\", MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"not a link", "/foo"}|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"\\", MarkdownElement[<|"Element" -> "`", "Data" -> "not code"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "1\\. not a list"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], " not a list"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "\\# not a heading"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\["|>], "foo]: /url \"not a reference\""}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "\\&ouml; not a character entity"|>]},
	"TestID"->"Backslash escapes-14"
	]

VerificationTest[
	ImportMarkdown["\\!\\\"\\#\\$\\%\\&\\'\\(\\)\\*\\+\\,\\-\\.\\/\\:\\;\\<\\=\\>\\?\\@\\[\\\\\\]\\^\\_\\`\\{\\|\\}\\~\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"\\!\\\"\\#\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "$"|>], "\\%\\&\\'", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\("|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\)"|>], "\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "\\+\\,\\-\\.\\/\\:\\;\\", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "\\=\\"|>], "\\?\\@", MarkdownElement[<|"Element" -> "LineLaTex", "Data" -> "\\\\"|>], "\\^\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], "\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "\\{\\|\\}\\~"}|>]},
	"TestID"->"Backslash escapes-12"
	]


(* ------------------------------ Blanks Lines ------------------------------ *)
VerificationTest[
	ImportMarkdown["  \n\naaa\n  \n\n# aaa\n\n  \n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "  "|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  "|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Heading", "Level" -> 1, "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  "|>]},
	"TestID"->"Blank lines-227"
	]

(* ------------------------------- Blockquotes ------------------------------ *)
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


(* ------------------------------- Code Spans ------------------------------- *)
VerificationTest[
	ImportMarkdown["` `` `\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Code spans-330"
	]

VerificationTest[
	ImportMarkdown["`  ``  `\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>], "  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Code spans-331"
	]

VerificationTest[
	ImportMarkdown["` `\n`  `\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "`", "Data" -> " "|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "`", "Data" -> "  "|>]}|>]},
	"TestID"->"Code spans-334"
	]

VerificationTest[
	ImportMarkdown["` a`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "`", "Data" -> " a"|>]}|>]},
	"TestID"->"Code spans-332"
	]

VerificationTest[
	ImportMarkdown["`<a href=\"`\">`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "`", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"`\""|>]}|>]}|>]},
	"TestID"->"Code spans-343"
	]

VerificationTest[
	ImportMarkdown["<a href=\"`\">`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"`\""|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Code spans-344"
	]

VerificationTest[
	ImportMarkdown["` b `\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "`", "Data" -> " b "|>]}|>]},
	"TestID"->"Code spans-333"
	]

VerificationTest[
	ImportMarkdown["```foo``\n"],
	{MarkdownElement[<|"Element" -> "CodeFence", "Data" -> "foo``"|>]},
	"TestID"->"Code spans-347"
	]

VerificationTest[
	ImportMarkdown["``\nfoo \n``\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>]}|>]},
	"TestID"->"Code spans-336"
	]

VerificationTest[
	ImportMarkdown["`foo\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "foo"}|>]},
	"TestID"->"Code spans-348"
	]

VerificationTest[
	ImportMarkdown["`foo`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "`", "Data" -> "foo"|>]}|>]},
	"TestID"->"Code spans-328"
	]

VerificationTest[
	ImportMarkdown["*foo`*`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> {"foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Code spans-341"
	]

VerificationTest[
	ImportMarkdown["`` foo ` bar ``\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>], " foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], " bar ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>]}|>]},
	"TestID"->"Code spans-329"
	]

VerificationTest[
	ImportMarkdown["` foo `` bar `\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], " foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>], " bar ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Code spans-340"
	]

VerificationTest[
	ImportMarkdown["``foo`bar``\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>]}|>]},
	"TestID"->"Code spans-339"
	]

VerificationTest[
	ImportMarkdown["`foo\\`bar`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "foo\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Code spans-338"
	]

VerificationTest[
	ImportMarkdown["`foo``bar``\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>]}|>]},
	"TestID"->"Code spans-349"
	]

VerificationTest[
	ImportMarkdown["``\nfoo\nbar  \nbaz\n``\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar  "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>]}|>]},
	"TestID"->"Code spans-335"
	]

VerificationTest[
	ImportMarkdown["`foo   bar \nbaz`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "foo   bar "}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"baz", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Code spans-337"
	]

VerificationTest[
	ImportMarkdown["`<http://foo.bar.`baz>`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "`", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "http://foo.bar.`baz"|>]}|>]}|>]},
	"TestID"->"Code spans-345"
	]

VerificationTest[
	ImportMarkdown["<http://foo.bar.`baz>`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "http://foo.bar.`baz"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Code spans-346"
	]

VerificationTest[
	ImportMarkdown["[not a `link](/foo`)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"not a `link", "/foo`"}|>]}|>]},
	"TestID"->"Code spans-342"
	]


(* ---------------------- Emphasis and Strong Emphasis ---------------------- *)
VerificationTest[
	ImportMarkdown["_\:043f\:0440\:0438\:0441\:0442\:0430\:043d\:044f\:043c_\:0441\:0442\:0440\:0435\:043c\:044f\:0442\:0441\:044f\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "\:043f\:0440\:0438\:0441\:0442\:0430\:043d\:044f\:043c"|>], "\:0441\:0442\:0440\:0435\:043c\:044f\:0442\:0441\:044f"}|>]},
	"TestID"->"Emphasis and strong emphasis-374"
	]

VerificationTest[
	ImportMarkdown["\:043f\:0440\:0438\:0441\:0442\:0430\:043d\:044f\:043c_\:0441\:0442\:0440\:0435\:043c\:044f\:0442\:0441\:044f_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"\:043f\:0440\:0438\:0441\:0442\:0430\:043d\:044f\:043c", MarkdownElement[<|"Element" -> "_", "Data" -> "\:0441\:0442\:0440\:0435\:043c\:044f\:0442\:0441\:044f"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-361"
	]

VerificationTest[
	ImportMarkdown["__\:043f\:0440\:0438\:0441\:0442\:0430\:043d\:044f\:043c__\:0441\:0442\:0440\:0435\:043c\:044f\:0442\:0441\:044f\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "__", "Data" -> "\:043f\:0440\:0438\:0441\:0442\:0430\:043d\:044f\:043c"|>], "\:0441\:0442\:0440\:0435\:043c\:044f\:0442\:0441\:044f"}|>]},
	"TestID"->"Emphasis and strong emphasis-400"
	]

VerificationTest[
	ImportMarkdown["\:043f\:0440\:0438\:0441\:0442\:0430\:043d\:044f\:043c__\:0441\:0442\:0440\:0435\:043c\:044f\:0442\:0441\:044f__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"\:043f\:0440\:0438\:0441\:0442\:0430\:043d\:044f\:043c", MarkdownElement[<|"Element" -> "__", "Data" -> "\:0441\:0442\:0440\:0435\:043c\:044f\:0442\:0441\:044f"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-387"
	]

VerificationTest[
	ImportMarkdown["5__6__78\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"5", MarkdownElement[<|"Element" -> "__", "Data" -> "6"|>], "78"}|>]},
	"TestID"->"Emphasis and strong emphasis-386"
	]

VerificationTest[
	ImportMarkdown["5*6*78\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"5", MarkdownElement[<|"Element" -> "*", "Data" -> "6"|>], "78"}|>]},
	"TestID"->"Emphasis and strong emphasis-355"
	]

VerificationTest[
	ImportMarkdown["5_6_78\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"5", MarkdownElement[<|"Element" -> "_", "Data" -> "6"|>], "78"}|>]},
	"TestID"->"Emphasis and strong emphasis-360"
	]

VerificationTest[
	ImportMarkdown["* a *\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {"a ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-353"
	]

VerificationTest[
	ImportMarkdown["*a `*`*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "a ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-477"
	]

VerificationTest[
	ImportMarkdown["_a `_`_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], "a ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-478"
	]

VerificationTest[
	ImportMarkdown["aa_\"bb\"_cc\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"aa", MarkdownElement[<|"Element" -> "_", "Data" -> "\"bb\""|>], "cc"}|>]},
	"TestID"->"Emphasis and strong emphasis-362"
	]

VerificationTest[
	ImportMarkdown["a**\"foo\"**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"a", MarkdownElement[<|"Element" -> "**", "Data" -> "\"foo\""|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-379"
	]

VerificationTest[
	ImportMarkdown["a__\"foo\"__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"a", MarkdownElement[<|"Element" -> "__", "Data" -> "\"foo\""|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-384"
	]

VerificationTest[
	ImportMarkdown["a*\"foo\"*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"a", MarkdownElement[<|"Element" -> "*", "Data" -> "\"foo\""|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-352"
	]

VerificationTest[
	ImportMarkdown["a_\"foo\"_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"a", MarkdownElement[<|"Element" -> "_", "Data" -> "\"foo\""|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-358"
	]

VerificationTest[
	ImportMarkdown["a * foo bar*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"a ", MarkdownElement[<|"Element" -> "*", "Data" -> " foo bar"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-351"
	]

VerificationTest[
	ImportMarkdown["**<a href=\"**\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"**\""|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-475"
	]

VerificationTest[
	ImportMarkdown["__<a href=\"__\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"__\""|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-476"
	]

VerificationTest[
	ImportMarkdown["**a<http://foo.bar/?q=**>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "a", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "http://foo.bar/?q=**"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-479"
	]

VerificationTest[
	ImportMarkdown["__a<http://foo.bar/?q=__>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>], "a", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "http://foo.bar/?q=__"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-480"
	]

VerificationTest[
	ImportMarkdown["__(bar)__.\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "__", "Data" -> "(bar)"|>], "."}|>]},
	"TestID"->"Emphasis and strong emphasis-402"
	]

VerificationTest[
	ImportMarkdown["_(bar)_.\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "(bar)"|>], "."}|>]},
	"TestID"->"Emphasis and strong emphasis-376"
	]

VerificationTest[
	ImportMarkdown["*[bar*](/url)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"bar*", "/url"}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-472"
	]

VerificationTest[
	ImportMarkdown["******foo******\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "******", "Data" -> "foo"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-465"
	]

VerificationTest[
	ImportMarkdown["**(**foo)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> "("|>], "foo)"}|>]},
	"TestID"->"Emphasis and strong emphasis-391"
	]

VerificationTest[
	ImportMarkdown["__(__foo)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "__", "Data" -> "("|>], "foo)"}|>]},
	"TestID"->"Emphasis and strong emphasis-397"
	]

VerificationTest[
	ImportMarkdown["_____foo_____\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_____", "Data" -> "foo"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-467"
	]

VerificationTest[
	ImportMarkdown["****foo*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "****"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-444"
	]

VerificationTest[
	ImportMarkdown["____foo_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "____"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-456"
	]

VerificationTest[
	ImportMarkdown["****foo****\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "****", "Data" -> "foo"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-463"
	]

VerificationTest[
	ImportMarkdown["*(**foo**)*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> {"(", MarkdownElement[<|"Element" -> "**", "Data" -> "foo"|>], ")"}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-392"
	]

VerificationTest[
	ImportMarkdown["_(__foo__)_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> {"(", MarkdownElement[<|"Element" -> "__", "Data" -> "foo"|>], ")"}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-398"
	]

VerificationTest[
	ImportMarkdown["____foo____\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "____", "Data" -> "foo"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-464"
	]

VerificationTest[
	ImportMarkdown["*(*foo)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "("|>], "foo)"}|>]},
	"TestID"->"Emphasis and strong emphasis-367"
	]

VerificationTest[
	ImportMarkdown["_(_foo)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "("|>], "foo)"}|>]},
	"TestID"->"Emphasis and strong emphasis-371"
	]

VerificationTest[
	ImportMarkdown["***foo**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-443"
	]

VerificationTest[
	ImportMarkdown["___foo__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "___"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-455"
	]

VerificationTest[
	ImportMarkdown["***foo***\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "***", "Data" -> "foo"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-466"
	]

VerificationTest[
	ImportMarkdown["*(*foo*)*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "("|>], "foo", MarkdownElement[<|"Element" -> "*", "Data" -> ")"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-368"
	]

VerificationTest[
	ImportMarkdown["_(_foo_)_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "("|>], "foo", MarkdownElement[<|"Element" -> "_", "Data" -> ")"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-372"
	]

VerificationTest[
	ImportMarkdown["**foo*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-441"
	]

VerificationTest[
	ImportMarkdown["__foo_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-453"
	]

VerificationTest[
	ImportMarkdown["**foo**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> "foo"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-459"
	]

VerificationTest[
	ImportMarkdown["*_foo_*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "foo"|>]}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-460"
	]

VerificationTest[
	ImportMarkdown["_*foo*_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>]}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-462"
	]

VerificationTest[
	ImportMarkdown["__foo__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "__", "Data" -> "foo"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-461"
	]

VerificationTest[
	ImportMarkdown["**foo***\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-445"
	]

VerificationTest[
	ImportMarkdown["__foo___\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "___"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-457"
	]

VerificationTest[
	ImportMarkdown["_foo*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-364"
	]

VerificationTest[
	ImportMarkdown["*foo**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-442"
	]

VerificationTest[
	ImportMarkdown["_foo__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-454"
	]

VerificationTest[
	ImportMarkdown["*foo****\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "****"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-446"
	]

VerificationTest[
	ImportMarkdown["_foo____\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "____"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-458"
	]

VerificationTest[
	ImportMarkdown["foo ***\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-435"
	]

VerificationTest[
	ImportMarkdown["foo *_*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-437"
	]

VerificationTest[
	ImportMarkdown["foo _*_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-449"
	]

VerificationTest[
	ImportMarkdown["foo ___\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "___"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-447"
	]

VerificationTest[
	ImportMarkdown["foo *\\**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-436"
	]

VerificationTest[
	ImportMarkdown["foo _\\__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], "\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-448"
	]

VerificationTest[
	ImportMarkdown["foo *****\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*****"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-438"
	]

VerificationTest[
	ImportMarkdown["foo **_**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-440"
	]

VerificationTest[
	ImportMarkdown["foo __*__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-452"
	]

VerificationTest[
	ImportMarkdown["foo _____\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_____"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-450"
	]

VerificationTest[
	ImportMarkdown["foo **\\***\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-439"
	]

VerificationTest[
	ImportMarkdown["foo __\\___\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>], "\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "___"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-451"
	]

VerificationTest[
	ImportMarkdown["____foo__ bar__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "____"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>], " bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-425"
	]

VerificationTest[
	ImportMarkdown["***foo** bar*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], " bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-412"
	]

VerificationTest[
	ImportMarkdown["***foo* bar**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], " bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-429"
	]

VerificationTest[
	ImportMarkdown["** foo bar**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> " foo bar"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-378"
	]

VerificationTest[
	ImportMarkdown["__\nfoo bar__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-383"
	]

VerificationTest[
	ImportMarkdown["__ foo bar__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "__", "Data" -> " foo bar"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-382"
	]

VerificationTest[
	ImportMarkdown["**foo **bar****\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "****"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-426"
	]

VerificationTest[
	ImportMarkdown["**foo**bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> "foo"|>], "bar"}|>]},
	"TestID"->"Emphasis and strong emphasis-395"
	]

VerificationTest[
	ImportMarkdown["__foo__bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "__", "Data" -> "foo"|>], "bar"}|>]},
	"TestID"->"Emphasis and strong emphasis-399"
	]

VerificationTest[
	ImportMarkdown["__foo_ bar_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], " bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-407"
	]

VerificationTest[
	ImportMarkdown["**foo *bar***\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-430"
	]

VerificationTest[
	ImportMarkdown["_ foo bar_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> " foo bar"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-357"
	]

VerificationTest[
	ImportMarkdown["**foo\nbar**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "foo"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-422"
	]

VerificationTest[
	ImportMarkdown["**foo bar**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> "foo bar"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-377"
	]

VerificationTest[
	ImportMarkdown["__foo bar__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "__", "Data" -> "foo bar"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-381"
	]

VerificationTest[
	ImportMarkdown["**foo bar **\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> "foo bar "|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-390"
	]

VerificationTest[
	ImportMarkdown["__foo bar __\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "__", "Data" -> "foo bar "|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-396"
	]

VerificationTest[
	ImportMarkdown["*foo **bar***\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-413"
	]

VerificationTest[
	ImportMarkdown["*foo**bar*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-411"
	]

VerificationTest[
	ImportMarkdown["*foo *bar**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-408"
	]

VerificationTest[
	ImportMarkdown["*foo**bar***\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-414"
	]

VerificationTest[
	ImportMarkdown["*foo*bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], "bar"}|>]},
	"TestID"->"Emphasis and strong emphasis-369"
	]

VerificationTest[
	ImportMarkdown["_foo_bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "foo"|>], "bar"}|>]},
	"TestID"->"Emphasis and strong emphasis-373"
	]

VerificationTest[
	ImportMarkdown["*foo\nbar*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-404"
	]

VerificationTest[
	ImportMarkdown["*foo bar*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo bar"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-350"
	]

VerificationTest[
	ImportMarkdown["_foo bar_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "foo bar"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-356"
	]

VerificationTest[
	ImportMarkdown["*foo bar\n*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo bar"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-366"
	]

VerificationTest[
	ImportMarkdown["*foo bar *\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo bar "|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-365"
	]

VerificationTest[
	ImportMarkdown["_foo bar _\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "foo bar "|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-370"
	]

VerificationTest[
	ImportMarkdown["foo-__(bar)__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo-", MarkdownElement[<|"Element" -> "__", "Data" -> "(bar)"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-389"
	]

VerificationTest[
	ImportMarkdown["foo-_(bar)_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo-", MarkdownElement[<|"Element" -> "_", "Data" -> "(bar)"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-363"
	]

VerificationTest[
	ImportMarkdown["foo**bar**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo", MarkdownElement[<|"Element" -> "**", "Data" -> "bar"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-380"
	]

VerificationTest[
	ImportMarkdown["foo__bar__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo", MarkdownElement[<|"Element" -> "__", "Data" -> "bar"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-385"
	]

VerificationTest[
	ImportMarkdown["foo*bar*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-354"
	]

VerificationTest[
	ImportMarkdown["foo_bar_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo", MarkdownElement[<|"Element" -> "_", "Data" -> "bar"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-359"
	]

VerificationTest[
	ImportMarkdown["__foo, __bar__, baz__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "__", "Data" -> "foo, "|>], "bar", MarkdownElement[<|"Element" -> "__", "Data" -> ", baz"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-388"
	]

VerificationTest[
	ImportMarkdown["__foo __bar__ baz__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "__", "Data" -> "foo "|>], "bar", MarkdownElement[<|"Element" -> "__", "Data" -> " baz"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-424"
	]

VerificationTest[
	ImportMarkdown["**foo **bar baz**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "bar baz", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-470"
	]

VerificationTest[
	ImportMarkdown["**foo *bar* baz**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>], " baz"}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-427"
	]

VerificationTest[
	ImportMarkdown["__foo__bar__baz__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "__", "Data" -> "foo"|>], "bar", MarkdownElement[<|"Element" -> "__", "Data" -> "baz"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-401"
	]

VerificationTest[
	ImportMarkdown["__foo _bar_ baz__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "__", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "_", "Data" -> "bar"|>], " baz"}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-423"
	]

VerificationTest[
	ImportMarkdown["**foo*bar*baz**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> {"foo", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>], "baz"}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-428"
	]

VerificationTest[
	ImportMarkdown["*foo **bar** baz*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "**", "Data" -> "bar"|>], " baz"}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-409"
	]

VerificationTest[
	ImportMarkdown["_foo __bar__ baz_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "__", "Data" -> "bar"|>], " baz"}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-405"
	]

VerificationTest[
	ImportMarkdown["*foo**bar**baz*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> {"foo", MarkdownElement[<|"Element" -> "**", "Data" -> "bar"|>], "baz"}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-410"
	]

VerificationTest[
	ImportMarkdown["*foo _bar* baz_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], "bar"}|>], " baz", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-468"
	]

VerificationTest[
	ImportMarkdown["_foo _bar_ baz_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "foo "|>], "bar", MarkdownElement[<|"Element" -> "_", "Data" -> " baz"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-406"
	]

VerificationTest[
	ImportMarkdown["*foo *bar baz*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "bar baz", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-471"
	]

VerificationTest[
	ImportMarkdown["_foo_bar_baz_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "foo"|>], "bar", MarkdownElement[<|"Element" -> "_", "Data" -> "baz"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-375"
	]

VerificationTest[
	ImportMarkdown["foo******bar*********baz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "******"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*********"|>], "baz"}|>]},
	"TestID"->"Emphasis and strong emphasis-416"
	]

VerificationTest[
	ImportMarkdown["foo***bar***baz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo", MarkdownElement[<|"Element" -> "***", "Data" -> "bar"|>], "baz"}|>]},
	"TestID"->"Emphasis and strong emphasis-415"
	]

VerificationTest[
	ImportMarkdown["*foo __bar *baz bim__ bam*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>], "bar ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "baz bim", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>], " bam", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-469"
	]

VerificationTest[
	ImportMarkdown["**foo *bar **baz**\nbim* bop**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "bar "}|>], "baz", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"bim", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], " bop", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-431"
	]

VerificationTest[
	ImportMarkdown["*foo **bar *baz* bim** bop*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "bar "}|>], "baz", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], " bim", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], " bop", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-417"
	]

VerificationTest[
	ImportMarkdown["**foo \"*bar*\" foo**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> {"foo \"", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>], "\" foo"}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-394"
	]

VerificationTest[
	ImportMarkdown["**foo [*bar*](/url)**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"*bar*", "/url"}|>]}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-432"
	]

VerificationTest[
	ImportMarkdown["**foo [bar](/url)**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"bar", "/url"}|>]}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-421"
	]

VerificationTest[
	ImportMarkdown["*foo [*bar*](/url)*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"*bar*", "/url"}|>]}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-418"
	]

VerificationTest[
	ImportMarkdown["_foo [bar_](/url)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], "foo ", MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"bar_", "/url"}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-473"
	]

VerificationTest[
	ImportMarkdown["*foo [bar](/url)*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"bar", "/url"}|>]}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-403"
	]

VerificationTest[
	ImportMarkdown["**Gomphocarpus (*Gomphocarpus physocarpus*, syn.\n*Asclepias physocarpa*)**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "Gomphocarpus (", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "Gomphocarpus physocarpus", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], ", syn."}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "Asclepias physocarpa", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], ")", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-393"
	]

VerificationTest[
	ImportMarkdown["*<img src=\"foo\" title=\"*\"/>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "img src=\"foo\" title=\"*\"/"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-474"
	]

VerificationTest[
	ImportMarkdown["** is not an empty emphasis\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], " is not an empty emphasis"}|>]},
	"TestID"->"Emphasis and strong emphasis-419"
	]

VerificationTest[
	ImportMarkdown["__ is not an empty emphasis\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>], " is not an empty emphasis"}|>]},
	"TestID"->"Emphasis and strong emphasis-433"
	]

VerificationTest[
	ImportMarkdown["**** is not an empty strong emphasis\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "****"|>], " is not an empty strong emphasis"}|>]},
	"TestID"->"Emphasis and strong emphasis-420"
	]

VerificationTest[
	ImportMarkdown["____ is not an empty strong emphasis\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "____"|>], " is not an empty strong emphasis"}|>]},
	"TestID"->"Emphasis and strong emphasis-434"
	]


(* ----------------- Entity and numeric character references ---------------- *)
VerificationTest[
	ImportMarkdown["&#35; &#1234; &#992; &#0;\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "&#35; &#1234; &#992; &#0;"|>]},
	"TestID"->"Entity and numeric character references-26"
	]

VerificationTest[
	ImportMarkdown["&#42;foo&#42;\n*foo*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "&#42;foo&#42;"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>]}|>]},
	"TestID"->"Entity and numeric character references-37"
	]

VerificationTest[
	ImportMarkdown["&#42; foo\n\n* foo\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "&#42; foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>]},
	"TestID"->"Entity and numeric character references-38"
	]

VerificationTest[
	ImportMarkdown["&#9;foo\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "&#9;foo"|>]},
	"TestID"->"Entity and numeric character references-40"
	]

VerificationTest[
	ImportMarkdown["<a href=\"&ouml;&ouml;.html\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"&ouml;&ouml;.html\""|>]}|>]},
	"TestID"->"Entity and numeric character references-31"
	]

VerificationTest[
	ImportMarkdown["[a](url &quot;tit&quot;)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"a", "url &quot;tit&quot;"}|>]}|>]},
	"TestID"->"Entity and numeric character references-41"
	]

VerificationTest[
	ImportMarkdown["&copy\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "&copy"|>]},
	"TestID"->"Entity and numeric character references-29"
	]

VerificationTest[
	ImportMarkdown["foo&#10;&#10;bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo&#10;&#10;bar"|>]},
	"TestID"->"Entity and numeric character references-39"
	]

VerificationTest[
	ImportMarkdown["[foo]\n\n[foo]: /f&ouml;&ouml; \"f&ouml;&ouml;\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /f&ouml;&ouml; \"f&ouml;&ouml;\""|>]},
	"TestID"->"Entity and numeric character references-33"
	]

VerificationTest[
	ImportMarkdown["[foo](/f&ouml;&ouml; \"f&ouml;&ouml;\")\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"foo", "/f&ouml;&ouml; \"f&ouml;&ouml;\""}|>]}|>]},
	"TestID"->"Entity and numeric character references-32"
	]

VerificationTest[
	ImportMarkdown["    f&ouml;f&ouml;\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "f&ouml;f&ouml;"|>]},
	"TestID"->"Entity and numeric character references-36"
	]

VerificationTest[
	ImportMarkdown["`f&ouml;&ouml;`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "`", "Data" -> "f&ouml;&ouml;"|>]}|>]},
	"TestID"->"Entity and numeric character references-35"
	]

VerificationTest[
	ImportMarkdown["``` f&ouml;&ouml;\nfoo\n```\n"],
	{MarkdownElement[<|"Element" -> "CodeFence", "Data" -> " f&ouml;&ouml;"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>]},
	"TestID"->"Entity and numeric character references-34"
	]

VerificationTest[
	ImportMarkdown["&MadeUpEntity;\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "&MadeUpEntity;"|>]},
	"TestID"->"Entity and numeric character references-30"
	]

VerificationTest[
	ImportMarkdown["&nbsp; &amp; &copy; &AElig; &Dcaron;\n&frac34; &HilbertSpace; &DifferentialD;\n&ClockwiseContourIntegral; &ngE;\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "&nbsp; &amp; &copy; &AElig; &Dcaron;"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "&frac34; &HilbertSpace; &DifferentialD;"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "&ClockwiseContourIntegral; &ngE;"|>]},
	"TestID"->"Entity and numeric character references-25"
	]

VerificationTest[
	ImportMarkdown["&nbsp &x; &#; &#x;\n&#87654321;\n&#abcdef0;\n&ThisIsNotDefined; &hi?;\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "&nbsp &x; &#; &#x;"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "&#87654321;"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "&#abcdef0;"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "&ThisIsNotDefined; &hi?;"|>]},
	"TestID"->"Entity and numeric character references-28"
	]

VerificationTest[
	ImportMarkdown["&#X22; &#XD06; &#xcab;\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "&#X22; &#XD06; &#xcab;"|>]},
	"TestID"->"Entity and numeric character references-27"
	]


(* ---------------------------- Fenced Codeblocks --------------------------- *)
VerificationTest[
	ImportMarkdown["```\n"],
	{MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>]},
	"TestID"->"Fenced code blocks-126"
	]

VerificationTest[
	ImportMarkdown["```\n```\n"],
	{MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>]},
	"TestID"->"Fenced code blocks-130"
	]

VerificationTest[
	ImportMarkdown["````;\n````\n"],
	{MarkdownElement[<|"Element" -> "CodeFence", "Data" -> "`;"|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> "`"|>]},
	"TestID"->"Fenced code blocks-144"
	]

VerificationTest[
	ImportMarkdown["```\n\n  \n```\n"],
	{MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  "|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>]},
	"TestID"->"Fenced code blocks-129"
	]

VerificationTest[
	ImportMarkdown["~~~\n<\n >\n~~~\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "~~~"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "<"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> " >"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "~~~"|>]},
	"TestID"->"Fenced code blocks-120"
	]

VerificationTest[
	ImportMarkdown["```\n<\n >\n```\n"],
	{MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "<"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> " >"|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>]},
	"TestID"->"Fenced code blocks-119"
	]

VerificationTest[
	ImportMarkdown["    ```\n    aaa\n    ```\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>]},
	"TestID"->"Fenced code blocks-134"
	]

VerificationTest[
	ImportMarkdown["`````\n\n```\naaa\n"],
	{MarkdownElement[<|"Element" -> "CodeFence", "Data" -> "``"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>]},
	"TestID"->"Fenced code blocks-127"
	]

VerificationTest[
	ImportMarkdown["``` ```\naaa\n"],
	{MarkdownElement[<|"Element" -> "CodeFence", "Data" -> " ```"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>]},
	"TestID"->"Fenced code blocks-138"
	]

VerificationTest[
	ImportMarkdown["```\n``` aaa\n```\n"],
	{MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> " aaa"|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>]},
	"TestID"->"Fenced code blocks-147"
	]

VerificationTest[
	ImportMarkdown["   ```\naaa\n  ```\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"   ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>]},
	"TestID"->"Fenced code blocks-136"
	]

VerificationTest[
	ImportMarkdown["~~~~~~\naaa\n~~~ ~~\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "~~~~~~"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "~~~ ~~"|>]},
	"TestID"->"Fenced code blocks-139"
	]

VerificationTest[
	ImportMarkdown["~~~~\naaa\n~~~\n~~~~\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "~~~~"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "~~~"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "~~~~"|>]},
	"TestID"->"Fenced code blocks-125"
	]

VerificationTest[
	ImportMarkdown["````\naaa\n```\n``````\n"],
	{MarkdownElement[<|"Element" -> "CodeFence", "Data" -> "`"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> "```"|>]},
	"TestID"->"Fenced code blocks-124"
	]

VerificationTest[
	ImportMarkdown["```\naaa\n  ```\n"],
	{MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>]},
	"TestID"->"Fenced code blocks-135"
	]

VerificationTest[
	ImportMarkdown["~~~\naaa\n```\n~~~\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "~~~"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "~~~"|>]},
	"TestID"->"Fenced code blocks-123"
	]

VerificationTest[
	ImportMarkdown["```\naaa\n~~~\n```\n"],
	{MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "~~~"|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>]},
	"TestID"->"Fenced code blocks-122"
	]

VerificationTest[
	ImportMarkdown["```\naaa\n    ```\n"],
	{MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>]},
	"TestID"->"Fenced code blocks-137"
	]

VerificationTest[
	ImportMarkdown[" ```\n aaa\naaa\n```\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {" ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> " aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>]},
	"TestID"->"Fenced code blocks-131"
	]

VerificationTest[
	ImportMarkdown["   ```\n   aaa\n    aaa\n  aaa\n   ```\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"   ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   aaa"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"   ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>]},
	"TestID"->"Fenced code blocks-133"
	]

VerificationTest[
	ImportMarkdown["  ```\naaa\n  aaa\naaa\n  ```\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>]},
	"TestID"->"Fenced code blocks-132"
	]

VerificationTest[
	ImportMarkdown["> ```\n> aaa\n\nbbb\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb"|>]},
	"TestID"->"Fenced code blocks-128"
	]

VerificationTest[
	ImportMarkdown["~~~ aa ``` ~~~\nfoo\n~~~\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"~~~ aa ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>], " ~~~"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "~~~"|>]},
	"TestID"->"Fenced code blocks-146"
	]

VerificationTest[
	ImportMarkdown["``` aa ```\nfoo\n"],
	{MarkdownElement[<|"Element" -> "CodeFence", "Data" -> " aa ```"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>]},
	"TestID"->"Fenced code blocks-145"
	]

VerificationTest[
	ImportMarkdown["``\nfoo\n``\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>]}|>]},
	"TestID"->"Fenced code blocks-121"
	]

VerificationTest[
	ImportMarkdown["foo\n---\n~~~\nbar\n~~~\n# baz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "~~~"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "~~~"|>], MarkdownElement[<|"Element" -> "Heading", "Level" -> 1, "Data" -> "baz"|>]},
	"TestID"->"Fenced code blocks-141"
	]

VerificationTest[
	ImportMarkdown["foo\n```\nbar\n```\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Fenced code blocks-140"
	]

VerificationTest[
	ImportMarkdown["```ruby\ndef foo(x)\n  return 3\nend\n```\n"],
	{MarkdownElement[<|"Element" -> "CodeFence", "Data" -> "ruby"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "def foo(x)"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  return 3"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "end"|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>]},
	"TestID"->"Fenced code blocks-142"
	]

VerificationTest[
	ImportMarkdown["~~~~    ruby startline=3 $%@#$\ndef foo(x)\n  return 3\nend\n~~~~~~~\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"~~~~    ruby startline=3 ", MarkdownElement[<|"Element" -> "$", "Data" -> "%@#"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "def foo(x)"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  return 3"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "end"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "~~~~~~~"|>]},
	"TestID"->"Fenced code blocks-143"
	]


(* ---------------------------- Hard line breaks ---------------------------- *)
VerificationTest[
	ImportMarkdown["<a href=\"foo  \nbar\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<a href=\"foo  "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar\">"|>]},
	"TestID"->"Hard line breaks-642"
	]

VerificationTest[
	ImportMarkdown["<a href=\"foo\\\nbar\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<a href=\"foo\\"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar\">"|>]},
	"TestID"->"Hard line breaks-643"
	]

VerificationTest[
	ImportMarkdown["`code  \nspan`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "code  "}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"span", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Hard line breaks-640"
	]

VerificationTest[
	ImportMarkdown["`code\\\nspan`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "code\\"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"span", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Hard line breaks-641"
	]

VerificationTest[
	ImportMarkdown["### foo\\\n"],
	{MarkdownElement[<|"Element" -> "Heading", "Level" -> 3, "Data" -> "foo\\"|>]},
	"TestID"->"Hard line breaks-646"
	]

VerificationTest[
	ImportMarkdown["### foo  \n"],
	{MarkdownElement[<|"Element" -> "Heading", "Level" -> 3, "Data" -> "foo  "|>]},
	"TestID"->"Hard line breaks-647"
	]

VerificationTest[
	ImportMarkdown["foo\\\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo\\"|>]},
	"TestID"->"Hard line breaks-644"
	]

VerificationTest[
	ImportMarkdown["foo  \n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo  "|>]},
	"TestID"->"Hard line breaks-645"
	]

VerificationTest[
	ImportMarkdown["*foo  \nbar*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo  "}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Hard line breaks-638"
	]

VerificationTest[
	ImportMarkdown["*foo\\\nbar*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo\\"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Hard line breaks-639"
	]

VerificationTest[
	ImportMarkdown["foo  \n     bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo  "|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> " bar"|>]},
	"TestID"->"Hard line breaks-636"
	]

VerificationTest[
	ImportMarkdown["foo\\\n     bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo\\"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> " bar"|>]},
	"TestID"->"Hard line breaks-637"
	]

VerificationTest[
	ImportMarkdown["foo       \nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo       "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Hard line breaks-635"
	]

VerificationTest[
	ImportMarkdown["foo  \nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo  "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Hard line breaks-633"
	]

VerificationTest[
	ImportMarkdown["foo\\\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo\\"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Hard line breaks-634"
	]


(* ------------------------------- HTMLBlocks ------------------------------- *)
VerificationTest[
	ImportMarkdown["<a href=\"foo\">\n*bar*\n</a>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"foo\""|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/a"|>]}|>]},
	"TestID"->"HTML blocks-162"
	]

VerificationTest[
	ImportMarkdown["<![CDATA[\nfunction matchwo(a,b)\n{\n  if (a < b && a < 0) then {\n    return 1;\n\n  } else {\n\n    return 0;\n  }\n}\n]]>\nokay\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<![CDATA["|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "function matchwo(a,b)"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "{"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  if (a < b && a < 0) then {"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "return 1;"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  } else {"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "return 0;"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  }"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "}"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "]]>"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "okay"|>]},
	"TestID"->"HTML blocks-182"
	]

VerificationTest[
	ImportMarkdown["<del>\n\n*foo*\n\n</del>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "del"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/del"|>]}|>]},
	"TestID"->"HTML blocks-167"
	]

VerificationTest[
	ImportMarkdown["<del>\n*foo*\n</del>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "del"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/del"|>]}|>]},
	"TestID"->"HTML blocks-166"
	]

VerificationTest[
	ImportMarkdown["<del>*foo*</del>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "del"|>], MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/del"|>]}|>]},
	"TestID"->"HTML blocks-168"
	]

VerificationTest[
	ImportMarkdown["<div><a href=\"bar\">*foo*</a></div>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "div"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"bar\""|>], MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/a"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/div"|>]}|>]},
	"TestID"->"HTML blocks-159"
	]

VerificationTest[
	ImportMarkdown["<div>\nbar\n</div>\n*foo*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "div"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/div"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>]}|>]},
	"TestID"->"HTML blocks-186"
	]

VerificationTest[
	ImportMarkdown["<div class\nfoo\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<div class"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>]},
	"TestID"->"HTML blocks-157"
	]

VerificationTest[
	ImportMarkdown["<DIV CLASS=\"foo\">\n\n*Markdown*\n\n</DIV>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "DIV CLASS=\"foo\""|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "Markdown"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/DIV"|>]}|>]},
	"TestID"->"HTML blocks-152"
	]

VerificationTest[
	ImportMarkdown["  <div>\n\n    <div>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "div"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "<div>"|>]},
	"TestID"->"HTML blocks-184"
	]

VerificationTest[
	ImportMarkdown["<div></div>\n``` c\nint x = 33;\n```\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "div"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/div"|>]}|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> " c"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "int x = 33;"|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>]},
	"TestID"->"HTML blocks-161"
	]

VerificationTest[
	ImportMarkdown["<div>\n\n*Emphasized* text.\n\n</div>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "div"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "Emphasized"|>], " text."}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/div"|>]}|>]},
	"TestID"->"HTML blocks-188"
	]

VerificationTest[
	ImportMarkdown["<div>\n*Emphasized* text.\n</div>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "div"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "Emphasized"|>], " text."}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/div"|>]}|>]},
	"TestID"->"HTML blocks-189"
	]

VerificationTest[
	ImportMarkdown["- <div>\n- foo\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "div"|>]}|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>]},
	"TestID"->"HTML blocks-175"
	]

VerificationTest[
	ImportMarkdown["</div>\n*foo*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/div"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>]}|>]},
	"TestID"->"HTML blocks-151"
	]

VerificationTest[
	ImportMarkdown["<div *???-&&&-<---\n*foo*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"<div ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "???-&&&-<---"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>]}|>]},
	"TestID"->"HTML blocks-158"
	]

VerificationTest[
	ImportMarkdown["> <div>\n> foo\n\nbar\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "<div>"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>]},
	"TestID"->"HTML blocks-174"
	]

VerificationTest[
	ImportMarkdown["<div>\n*foo*\n\n*bar*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "div"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>]}|>]},
	"TestID"->"HTML blocks-155"
	]

VerificationTest[
	ImportMarkdown[" <div>\n  *hello*\n         <foo><a>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {" ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "div"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "*", "Data" -> "hello"|>]}|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "     <foo><a>"|>]},
	"TestID"->"HTML blocks-150"
	]

VerificationTest[
	ImportMarkdown["<div id=\"foo\" class=\"bar\n  baz\">\n</div>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<div id=\"foo\" class=\"bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  baz\">"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/div"|>]}|>]},
	"TestID"->"HTML blocks-154"
	]

VerificationTest[
	ImportMarkdown["<div id=\"foo\"\n  class=\"bar\">\n</div>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<div id=\"foo\""|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  class=\"bar\">"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/div"|>]}|>]},
	"TestID"->"HTML blocks-153"
	]

VerificationTest[
	ImportMarkdown["<div id=\"foo\"\n*hi*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<div id=\"foo\""|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "hi"|>]}|>]},
	"TestID"->"HTML blocks-156"
	]

VerificationTest[
	ImportMarkdown["<!DOCTYPE html>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "!DOCTYPE html"|>]}|>]},
	"TestID"->"HTML blocks-181"
	]

VerificationTest[
	ImportMarkdown["Foo\n<a href=\"bar\">\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"bar\""|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"HTML blocks-187"
	]

VerificationTest[
	ImportMarkdown["<!-- foo -->*bar*\n*baz*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "!-- foo --"|>], MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "baz"|>]}|>]},
	"TestID"->"HTML blocks-177"
	]

VerificationTest[
	ImportMarkdown["<!-- Foo\n\nbar\n   baz -->\nokay\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<!-- Foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   baz -->"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "okay"|>]},
	"TestID"->"HTML blocks-179"
	]

VerificationTest[
	ImportMarkdown["Foo\n<div>\nbar\n</div>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "div"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/div"|>]}|>]},
	"TestID"->"HTML blocks-185"
	]

VerificationTest[
	ImportMarkdown["  <!-- foo -->\n\n    <!-- foo -->\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "!-- foo --"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "<!-- foo -->"|>]},
	"TestID"->"HTML blocks-183"
	]

VerificationTest[
	ImportMarkdown["<i class=\"foo\">\n*bar*\n</i>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "i class=\"foo\""|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/i"|>]}|>]},
	"TestID"->"HTML blocks-164"
	]

VerificationTest[
	ImportMarkdown["</ins>\n*bar*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/ins"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>]}|>]},
	"TestID"->"HTML blocks-165"
	]

VerificationTest[
	ImportMarkdown["<?php\n\n  echo '>';\n\n?>\nokay\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<?php"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  echo '>';"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "?>"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "okay"|>]},
	"TestID"->"HTML blocks-180"
	]

VerificationTest[
	ImportMarkdown["<pre language=\"haskell\"><code>\nimport Text.HTML.TagSoup\n\nmain :: IO ()\nmain = print $ parseTags tags\n</code></pre>\nokay\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "pre language=\"haskell\""|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "code"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "import Text.HTML.TagSoup"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "main :: IO ()"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"main = print ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "$"|>], " parseTags tags"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/code"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/pre"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "okay"|>]},
	"TestID"->"HTML blocks-169"
	]

VerificationTest[
	ImportMarkdown["<script>\nfoo\n</script>1. *bar*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "script"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/script"|>], "1. ", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>]}|>]},
	"TestID"->"HTML blocks-178"
	]

VerificationTest[
	ImportMarkdown["<script type=\"text/javascript\">\n// JavaScript example\n\ndocument.getElementById(\"demo\").innerHTML = \"Hello JavaScript!\";\n</script>\nokay\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "script type=\"text/javascript\""|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "// JavaScript example"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "document.getElementById(\"demo\").innerHTML = \"Hello JavaScript!\";"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/script"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "okay"|>]},
	"TestID"->"HTML blocks-170"
	]

VerificationTest[
	ImportMarkdown["<style>p{color:red;}</style>\n*foo*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "style"|>], "p{color:red;}", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/style"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>]}|>]},
	"TestID"->"HTML blocks-176"
	]

VerificationTest[
	ImportMarkdown["<style\n  type=\"text/css\">\n\nfoo\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<style"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  type=\"text/css\">"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>]},
	"TestID"->"HTML blocks-173"
	]

VerificationTest[
	ImportMarkdown["<style\n  type=\"text/css\">\nh1 {color:red;}\n\np {color:blue;}\n</style>\nokay\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<style"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  type=\"text/css\">"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "h1 {color:red;}"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "p {color:blue;}"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/style"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "okay"|>]},
	"TestID"->"HTML blocks-172"
	]

VerificationTest[
	ImportMarkdown["<table><tr><td>\nfoo\n</td></tr></table>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "table"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "tr"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "td"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/td"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/tr"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/table"|>]}|>]},
	"TestID"->"HTML blocks-160"
	]

VerificationTest[
	ImportMarkdown["<table>\n\n  <tr>\n\n    <td>\n      Hi\n    </td>\n\n  </tr>\n\n</table>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "table"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "tr"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "<td>"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  Hi"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "</td>"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/tr"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/table"|>]}|>]},
	"TestID"->"HTML blocks-191"
	]

VerificationTest[
	ImportMarkdown["<table>\n\n<tr>\n\n<td>\nHi\n</td>\n\n</tr>\n\n</table>\n"],
	MarkdownParser[FaizonZaman`WLMarkdown`Lexer`Private`DelimiterLexer[{MarkdownToken[<|"Token" -> "Line", "Data" -> {MarkdownToken[<|"Token" -> "Hyperlink", "Data" -> "table"|>]}|>], MarkdownToken[<|"Token" -> "EmptyLine"|>], MarkdownToken[<|"Token" -> "Line", "Data" -> {MarkdownToken[<|"Token" -> "Hyperlink", "Data" -> "tr"|>]}|>], {MarkdownToken[<|"Token" -> "EmptyLine"|>], MarkdownToken[<|"Token" -> "Line", "Data" -> {MarkdownToken[<|"Token" -> "Hyperlink", "Data" -> "td"|>]}|>], MarkdownToken[<|"Token" -> "Line", "Data" -> "Hi"|>], MarkdownToken[<|"Token" -> "Line", "Data" -> {MarkdownToken[<|"Token" -> "Hyperlink", "Data" -> "/td"|>]}|>], MarkdownToken[<|"Token" -> "EmptyLine"|>]}, MarkdownToken[<|"Token" -> "Line", "Data" -> {MarkdownToken[<|"Token" -> "Hyperlink", "Data" -> "/tr"|>]}|>], MarkdownToken[<|"Token" -> "EmptyLine"|>], MarkdownToken[<|"Token" -> "Line", "Data" -> {MarkdownToken[<|"Token" -> "Hyperlink", "Data" -> "/table"|>]}|>]}, {FaizonZaman`WLMarkdown`TokenRules`Private`d:"*" | "_" | "`" | "\\[" | "\\]" | "$" | "\\(" | "\\)" :> FaizonZaman`WLMarkdown`TokenRules`Private`$TokenData[Association["Token" -> "Delimiter", "Data" -> FaizonZaman`WLMarkdown`TokenRules`Private`d]]}], {MarkdownToken[KeyValuePattern[{"Token" -> FaizonZaman`WLMarkdown`ElementRules`Private`token_, "Level" -> FaizonZaman`WLMarkdown`ElementRules`Private`level_, "Data" -> FaizonZaman`WLMarkdown`ElementRules`Private`data_}]] :> FaizonZaman`WLMarkdown`ElementRules`$ElementLevelData[Association["Element" -> FaizonZaman`WLMarkdown`ElementRules`Private`token, "Level" -> FaizonZaman`WLMarkdown`ElementRules`Private`level, "Data" -> FaizonZaman`WLMarkdown`ElementRules`Private`data]], MarkdownToken[KeyValuePattern[{"Token" -> FaizonZaman`WLMarkdown`ElementRules`Private`token_, "Data" -> FaizonZaman`WLMarkdown`ElementRules`Private`data_}]] :> FaizonZaman`WLMarkdown`ElementRules`$ElementData[Association["Element" -> FaizonZaman`WLMarkdown`ElementRules`Private`token, "Data" -> FaizonZaman`WLMarkdown`ElementRules`Private`data]], MarkdownToken[KeyValuePattern[{"Token" -> FaizonZaman`WLMarkdown`ElementRules`Private`token_}]] :> FaizonZaman`WLMarkdown`ElementRules`$Element[Association["Element" -> FaizonZaman`WLMarkdown`ElementRules`Private`token]]}],
	"TestID"->"HTML blocks-190"
	]

VerificationTest[
	ImportMarkdown["<table>\n  <tr>\n    <td>\n           hi\n    </td>\n  </tr>\n</table>\n\nokay.\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "table"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "tr"|>]}|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "<td>"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "       hi"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "</td>"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/tr"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/table"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "okay."|>]},
	"TestID"->"HTML blocks-149"
	]

VerificationTest[
	ImportMarkdown["<table><tr><td>\n<pre>\n**Hello**,\n\n_world_.\n</pre>\n</td></tr></table>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "table"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "tr"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "td"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "pre"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> "Hello"|>], ","}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "world"|>], "."}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/pre"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/td"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/tr"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/table"|>]}|>]},
	"TestID"->"HTML blocks-148"
	]

VerificationTest[
	ImportMarkdown["<textarea>\n\n*foo*\n\n_bar_\n\n</textarea>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "textarea"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "bar"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/textarea"|>]}|>]},
	"TestID"->"HTML blocks-171"
	]

VerificationTest[
	ImportMarkdown["<Warning>\n*bar*\n</Warning>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "Warning"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/Warning"|>]}|>]},
	"TestID"->"HTML blocks-163"
	]


(* --------------------------------- Images --------------------------------- *)
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


(* --------------------------- Indented codeblocks -------------------------- *)
VerificationTest[
	ImportMarkdown["1.  foo\n\n    - bar\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> " foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 2, "Data" -> "bar"|>]},
	"TestID"->"Indented code blocks-109"
	]

VerificationTest[
	ImportMarkdown["    <a/>\n    *hi*\n\n    - one\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "<a/>"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "hi"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 2, "Data" -> "one"|>]},
	"TestID"->"Indented code blocks-110"
	]

VerificationTest[
	ImportMarkdown["    a simple\n      indented code block\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "a simple"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  indented code block"|>]},
	"TestID"->"Indented code blocks-107"
	]

VerificationTest[
	ImportMarkdown["    chunk1\n      \n      chunk2\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "chunk1"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  "|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  chunk2"|>]},
	"TestID"->"Indented code blocks-112"
	]

VerificationTest[
	ImportMarkdown["    chunk1\n\n    chunk2\n  \n \n \n    chunk3\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "chunk1"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "chunk2"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> " "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> " "|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "chunk3"|>]},
	"TestID"->"Indented code blocks-111"
	]

VerificationTest[
	ImportMarkdown["\n    \n    foo\n    \n\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> {}|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> {}|>]},
	"TestID"->"Indented code blocks-117"
	]

VerificationTest[
	ImportMarkdown["    foo  \n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "foo  "|>]},
	"TestID"->"Indented code blocks-118"
	]

VerificationTest[
	ImportMarkdown["        foo\n    bar\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "    foo"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "bar"|>]},
	"TestID"->"Indented code blocks-116"
	]

VerificationTest[
	ImportMarkdown["  - foo\n\n    bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "bar"|>]},
	"TestID"->"Indented code blocks-108"
	]

VerificationTest[
	ImportMarkdown["    foo\nbar\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>]},
	"TestID"->"Indented code blocks-114"
	]

VerificationTest[
	ImportMarkdown["Foo\n    bar\n\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "bar"|>]},
	"TestID"->"Indented code blocks-113"
	]

VerificationTest[
	ImportMarkdown["# Heading\n    foo\nHeading\n------\n    foo\n----\n"],
	{MarkdownElement[<|"Element" -> "Heading", "Level" -> 1, "Data" -> "Heading"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "Heading"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "------"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "----"|>]},
	"TestID"->"Indented code blocks-115"
	]


(* --------------------------------- Inlines -------------------------------- *)
VerificationTest[
	ImportMarkdown["`hi`lo`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "hi", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "lo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Inlines-327"
	]


(* ----------------------- Link reference definitions ----------------------- *)
VerificationTest[
	ImportMarkdown["Foo\n[bar]: /baz\n\n[bar]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[bar]: /baz"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[bar]"|>]},
	"TestID"->"Link reference definitions-213"
	]

VerificationTest[
	ImportMarkdown["[foo]: <bar>(baz)\n\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"[foo]: ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "bar"|>], "(baz)"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-201"
	]

VerificationTest[
	ImportMarkdown["[Foo bar]:\n<my url>\n'title'\n\n[Foo bar]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[Foo bar]:"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "my url"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "'title'"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[Foo bar]"|>]},
	"TestID"->"Link reference definitions-195"
	]

VerificationTest[
	ImportMarkdown["[Foo*bar\\]]:my_(url) 'title (with parens)'\n\n[Foo*bar\\]]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"[Foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\]"|>], "]:my", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], "(url) 'title (with parens)'"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"[Foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\]"|>], "]"}|>]},
	"TestID"->"Link reference definitions-194"
	]

VerificationTest[
	ImportMarkdown["[foo]: <>\n\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: <>"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-200"
	]

VerificationTest[
	ImportMarkdown["[foo]:\n\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]:"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-199"
	]

VerificationTest[
	ImportMarkdown["[foo]\n\n[foo]: first\n[foo]: second\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: first"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: second"|>]},
	"TestID"->"Link reference definitions-204"
	]

VerificationTest[
	ImportMarkdown["[foo]\n\n> [foo]: /url\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "[foo]: /url"|>]},
	"TestID"->"Link reference definitions-218"
	]

VerificationTest[
	ImportMarkdown["[foo]\n\n[foo]: url\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: url"|>]},
	"TestID"->"Link reference definitions-203"
	]

VerificationTest[
	ImportMarkdown["# [Foo]\n[foo]: /url\n> bar\n"],
	{MarkdownElement[<|"Element" -> "Heading", "Level" -> 1, "Data" -> "[Foo]"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "bar"|>]},
	"TestID"->"Link reference definitions-214"
	]

VerificationTest[
	ImportMarkdown["[foo]: /foo-url \"foo\"\n[bar]: /bar-url\n  \"bar\"\n[baz]: /baz-url\n\n[foo],\n[bar],\n[baz]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /foo-url \"foo\""|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[bar]: /bar-url"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  \"bar\""|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[baz]: /baz-url"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo],"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[bar],"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[baz]"|>]},
	"TestID"->"Link reference definitions-217"
	]

VerificationTest[
	ImportMarkdown["[foo]: /url\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url"|>]},
	"TestID"->"Link reference definitions-207"
	]

VerificationTest[
	ImportMarkdown["[\nfoo\n]: /url\nbar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "["|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "]: /url"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>]},
	"TestID"->"Link reference definitions-208"
	]

VerificationTest[
	ImportMarkdown["[foo]: /url\\bar\\*baz \"foo\\\"bar\\baz\"\n\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"[foo]: /url\\bar\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "baz \"foo\\\"bar\\baz\""}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-202"
	]

VerificationTest[
	ImportMarkdown["[foo]: /url\nbar\n===\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "==="|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-215"
	]

VerificationTest[
	ImportMarkdown["```\n[foo]: /url\n```\n\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url"|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-212"
	]

VerificationTest[
	ImportMarkdown["[foo]: /url\n===\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "==="|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-216"
	]

VerificationTest[
	ImportMarkdown["[foo]:\n/url\n\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]:"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "/url"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-198"
	]

VerificationTest[
	ImportMarkdown["[FOO]: /url\n\n[Foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[FOO]: /url"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[Foo]"|>]},
	"TestID"->"Link reference definitions-205"
	]

VerificationTest[
	ImportMarkdown["   [foo]: \n      /url  \n           'the title'  \n\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "   [foo]: "|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  /url  "|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "       'the title'  "|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-193"
	]

VerificationTest[
	ImportMarkdown["    [foo]: /url \"title\"\n\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "[foo]: /url \"title\""|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-211"
	]

VerificationTest[
	ImportMarkdown["[foo]: /url \"title\"\n\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-192"
	]

VerificationTest[
	ImportMarkdown["[foo]: /url '\ntitle\nline1\nline2\n'\n\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url '"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "title"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "line1"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "line2"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "'"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-196"
	]

VerificationTest[
	ImportMarkdown["[foo]: /url\n\"title\" ok\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "\"title\" ok"|>]},
	"TestID"->"Link reference definitions-210"
	]

VerificationTest[
	ImportMarkdown["[foo]: /url \"title\" ok\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\" ok"|>]},
	"TestID"->"Link reference definitions-209"
	]

VerificationTest[
	ImportMarkdown["[foo]: /url 'title\n\nwith blank line'\n\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url 'title"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "with blank line'"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-197"
	]

VerificationTest[
	ImportMarkdown["[A\[CapitalGamma]\[CapitalOmega]]: /\[CurlyPhi]\[Omicron]\[Upsilon]\n\n[\[Alpha]\[Gamma]\[Omega]]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[A\[CapitalGamma]\[CapitalOmega]]: /\[CurlyPhi]\[Omicron]\[Upsilon]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[\[Alpha]\[Gamma]\[Omega]]"|>]},
	"TestID"->"Link reference definitions-206"
	]


(* ---------------------------------- Links --------------------------------- *)
VerificationTest[
	ImportMarkdown["[]()\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[]()"|>]},
	"TestID"->"Links-486"
	]

VerificationTest[
	ImportMarkdown["[a](<b)c>)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"a", "<b"}|>], "c>)"}|>]},
	"TestID"->"Links-491"
	]

VerificationTest[
	ImportMarkdown["[a](<b)c\n[a](<b)c>\n[a](<b>c)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"a", "<b"}|>], "c"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"a", "<b"}|>], "c>"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"a", "<b>c"}|>]}|>]},
	"TestID"->"Links-493"
	]

VerificationTest[
	ImportMarkdown["[[bar [foo]\n\n[foo]: /url\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[[bar [foo]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url"|>]},
	"TestID"->"Links-559"
	]

VerificationTest[
	ImportMarkdown["[bar][foo\\!]\n\n[foo!]: /url\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"bar", "foo\\!"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo!]: /url"|>]},
	"TestID"->"Links-544"
	]

VerificationTest[
	ImportMarkdown["[bar\\\\]: /uri\n\n[bar\\\\]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"[bar\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\]"|>], ": /uri"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"[bar\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\]"|>]}|>]},
	"TestID"->"Links-549"
	]

VerificationTest[
	ImportMarkdown["[foo <bar attr=\"](baz)\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"foo <bar attr=\"", "baz"}|>], "\">"}|>]},
	"TestID"->"Links-523"
	]

VerificationTest[
	ImportMarkdown["[foo <bar attr=\"][ref]\">\n\n[ref]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo <bar attr=\"", "ref"}|>], "\">"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref]: /uri"|>]},
	"TestID"->"Links-535"
	]

VerificationTest[
	ImportMarkdown["[foo]\n[bar]\n\n[bar]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[bar]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[bar]: /url \"title\""|>]},
	"TestID"->"Links-542"
	]

VerificationTest[
	ImportMarkdown["[foo] [bar]\n\n[bar]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo] [bar]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[bar]: /url \"title\""|>]},
	"TestID"->"Links-541"
	]

VerificationTest[
	ImportMarkdown["[foo][bar]\n\n[bar]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo", "bar"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[bar]: /url \"title\""|>]},
	"TestID"->"Links-526"
	]

VerificationTest[
	ImportMarkdown["[foo][BaR]\n\n[bar]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo", "BaR"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[bar]: /url \"title\""|>]},
	"TestID"->"Links-538"
	]

VerificationTest[
	ImportMarkdown["*foo [bar* baz]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo [bar"|>], " baz]"}|>]},
	"TestID"->"Links-522"
	]

VerificationTest[
	ImportMarkdown["[foo *bar](baz*)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"foo *bar", "baz*"}|>]}|>]},
	"TestID"->"Links-521"
	]

VerificationTest[
	ImportMarkdown["[foo][bar][baz]\n\n[baz]: /url\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo", "bar"}|>], "[baz]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[baz]: /url"|>]},
	"TestID"->"Links-568"
	]

VerificationTest[
	ImportMarkdown["[foo][bar][baz]\n\n[baz]: /url1\n[bar]: /url2\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo", "bar"}|>], "[baz]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[baz]: /url1"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[bar]: /url2"|>]},
	"TestID"->"Links-569"
	]

VerificationTest[
	ImportMarkdown["[foo][bar][baz]\n\n[baz]: /url1\n[foo]: /url2\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo", "bar"}|>], "[baz]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[baz]: /url1"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url2"|>]},
	"TestID"->"Links-570"
	]

VerificationTest[
	ImportMarkdown["[foo *bar [baz][ref]*][ref]\n\n[ref]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo *bar [baz", "ref"}|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "][ref]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref]: /uri"|>]},
	"TestID"->"Links-532"
	]

VerificationTest[
	ImportMarkdown["[foo *[bar [baz](/uri)](/uri)*](/uri)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"foo *[bar [baz", "/uri"}|>], "](/uri)", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "](/uri)"}|>]},
	"TestID"->"Links-518"
	]

VerificationTest[
	ImportMarkdown["[[*foo* bar]]\n\n[*foo* bar]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"[[", MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], " bar]]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"[", MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], " bar]: /url \"title\""}|>]},
	"TestID"->"Links-558"
	]

VerificationTest[
	ImportMarkdown["[*foo* bar][]\n\n[*foo* bar]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"[", MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], " bar][]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"[", MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], " bar]: /url \"title\""}|>]},
	"TestID"->"Links-553"
	]

VerificationTest[
	ImportMarkdown["[*foo* bar]\n\n[*foo* bar]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"[", MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], " bar]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"[", MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], " bar]: /url \"title\""}|>]},
	"TestID"->"Links-557"
	]

VerificationTest[
	ImportMarkdown["[foo] bar\n\n[foo]: /url\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo] bar"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url"|>]},
	"TestID"->"Links-561"
	]

VerificationTest[
	ImportMarkdown["[foo][bar]\n\n[foo]: /url1\n[bar]: /url2\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo", "bar"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url1"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[bar]: /url2"|>]},
	"TestID"->"Links-564"
	]

VerificationTest[
	ImportMarkdown["[foo *bar][ref]*\n\n[ref]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo *bar", "ref"}|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref]: /uri"|>]},
	"TestID"->"Links-534"
	]

VerificationTest[
	ImportMarkdown["[foo [bar](/uri)][ref]\n\n[ref]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"foo [bar", "/uri"}|>], "][ref]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref]: /uri"|>]},
	"TestID"->"Links-531"
	]

VerificationTest[
	ImportMarkdown["[foo [bar](/uri)](/uri)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"foo [bar", "/uri"}|>], "](/uri)"}|>]},
	"TestID"->"Links-517"
	]

VerificationTest[
	ImportMarkdown["[Foo\n  bar]: /url\n\n[Baz][Foo bar]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  bar]: /url"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"Baz", "Foo bar"}|>]}|>]},
	"TestID"->"Links-540"
	]

VerificationTest[
	ImportMarkdown["[[[foo]]]\n\n[[[foo]]]: /url\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[[[foo]]]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[[[foo]]]: /url"|>]},
	"TestID"->"Links-547"
	]

VerificationTest[
	ImportMarkdown["[foo]()\n\n[foo]: /url1\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]()"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url1"|>]},
	"TestID"->"Links-566"
	]

VerificationTest[
	ImportMarkdown["[foo][]\n\n[foo]: /url1\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo][]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url1"|>]},
	"TestID"->"Links-565"
	]

VerificationTest[
	ImportMarkdown["\\[foo]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\["|>], "foo]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Links-562"
	]

VerificationTest[
	ImportMarkdown["[foo] \n[]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo] "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Links-555"
	]

VerificationTest[
	ImportMarkdown["[foo][]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo][]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Links-552"
	]

VerificationTest[
	ImportMarkdown["[Foo][]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[Foo][]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Links-554"
	]

VerificationTest[
	ImportMarkdown["[foo]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Links-556"
	]

VerificationTest[
	ImportMarkdown["[Foo]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[Foo]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Links-560"
	]

VerificationTest[
	ImportMarkdown["[foo<http://example.com/?search=][ref]>\n\n[ref]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo<http://example.com/?search=", "ref"}|>], ">"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref]: /uri"|>]},
	"TestID"->"Links-537"
	]

VerificationTest[
	ImportMarkdown["[foo<http://example.com/?search=](uri)>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"foo<http://example.com/?search=", "uri"}|>], ">"}|>]},
	"TestID"->"Links-525"
	]

VerificationTest[
	ImportMarkdown["[foo](not a link)\n\n[foo]: /url1\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"foo", "not a link"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url1"|>]},
	"TestID"->"Links-567"
	]

VerificationTest[
	ImportMarkdown["[foo][ref[bar]]\n\n[ref[bar]]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo", "ref[bar"}|>], "]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref[bar]]: /uri"|>]},
	"TestID"->"Links-546"
	]

VerificationTest[
	ImportMarkdown["*[foo*][ref]\n\n[ref]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo*", "ref"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref]: /uri"|>]},
	"TestID"->"Links-533"
	]

VerificationTest[
	ImportMarkdown["[foo`][ref]`\n\n[ref]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo`", "ref"}|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref]: /uri"|>]},
	"TestID"->"Links-536"
	]

VerificationTest[
	ImportMarkdown["[foo][ref\\[]\n\n[ref\\[]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo", "ref\\["}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"[ref", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\["|>], "]: /uri"}|>]},
	"TestID"->"Links-548"
	]

VerificationTest[
	ImportMarkdown["[foo][ref[]\n\n[ref[]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo", "ref["}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref[]: /uri"|>]},
	"TestID"->"Links-545"
	]

VerificationTest[
	ImportMarkdown["*[foo*](/uri)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"foo*", "/uri"}|>]}|>]},
	"TestID"->"Links-520"
	]

VerificationTest[
	ImportMarkdown["[foo`](/uri)`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"foo`", "/uri"}|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Links-524"
	]

VerificationTest[
	ImportMarkdown["![[[foo](uri1)](uri2)](uri3)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Image", "Data" -> {"[[foo", "uri1"}|>], "](uri2)](uri3)"}|>]},
	"TestID"->"Links-519"
	]

VerificationTest[
	ImportMarkdown["[foo]: /url1\n\n[foo]: /url2\n\n[bar][foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url1"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url2"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"bar", "foo"}|>]}|>]},
	"TestID"->"Links-543"
	]

VerificationTest[
	ImportMarkdown["[foo*]: /url\n\n*[foo*]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"[foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "]: /url"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "[foo"|>], "]"}|>]},
	"TestID"->"Links-563"
	]

VerificationTest[
	ImportMarkdown["[link]()\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[link]()"|>]},
	"TestID"->"Links-484"
	]

VerificationTest[
	ImportMarkdown["[link](<>)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "<>"}|>]}|>]},
	"TestID"->"Links-485"
	]

VerificationTest[
	ImportMarkdown["[link \\[bar][ref]\n\n[ref]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"link \\[bar", "ref"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref]: /uri"|>]},
	"TestID"->"Links-528"
	]

VerificationTest[
	ImportMarkdown["[link \\[bar](/uri)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link \\[bar", "/uri"}|>]}|>]},
	"TestID"->"Links-514"
	]

VerificationTest[
	ImportMarkdown["[link] bar](/uri)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link] bar", "/uri"}|>]}|>]},
	"TestID"->"Links-512"
	]

VerificationTest[
	ImportMarkdown["[link [bar](/uri)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link [bar", "/uri"}|>]}|>]},
	"TestID"->"Links-513"
	]

VerificationTest[
	ImportMarkdown["[link](\\(foo\\))\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "\\(foo\\"}|>], ")"}|>]},
	"TestID"->"Links-494"
	]

VerificationTest[
	ImportMarkdown["[link](<foo\\>)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "<foo\\>"}|>]}|>]},
	"TestID"->"Links-492"
	]

VerificationTest[
	ImportMarkdown["[link](foo\\)\\:)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "foo\\"}|>], "\\:)"}|>]},
	"TestID"->"Links-499"
	]

VerificationTest[
	ImportMarkdown["[link](foo%20b&auml;)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "foo%20b&auml;"}|>]}|>]},
	"TestID"->"Links-502"
	]

VerificationTest[
	ImportMarkdown["[link](<foo(and(bar)>)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "<foo(and(bar"}|>], ">)"}|>]},
	"TestID"->"Links-498"
	]

VerificationTest[
	ImportMarkdown["[link](foo\\(and\\(bar\\))\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "foo\\(and\\(bar\\"}|>], ")"}|>]},
	"TestID"->"Links-497"
	]

VerificationTest[
	ImportMarkdown["[link](foo(and(bar))\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "foo(and(bar"}|>], ")"}|>]},
	"TestID"->"Links-496"
	]

VerificationTest[
	ImportMarkdown["[link](foo(and(bar)))\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "foo(and(bar"}|>], "))"}|>]},
	"TestID"->"Links-495"
	]

VerificationTest[
	ImportMarkdown["[link](<foo\nbar>)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[link](<foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar>)"|>]},
	"TestID"->"Links-490"
	]

VerificationTest[
	ImportMarkdown["[link](foo\\bar)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "foo\\bar"}|>]}|>]},
	"TestID"->"Links-501"
	]

VerificationTest[
	ImportMarkdown["[link](foo\nbar)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[link](foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar)"|>]},
	"TestID"->"Links-489"
	]

VerificationTest[
	ImportMarkdown["[link *foo **bar** `#`*][ref]\n\n[ref]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"link *foo **bar** `#`*", "ref"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref]: /uri"|>]},
	"TestID"->"Links-529"
	]

VerificationTest[
	ImportMarkdown["[link [foo [bar]]][ref]\n\n[ref]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"link [foo [bar]]", "ref"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref]: /uri"|>]},
	"TestID"->"Links-527"
	]

VerificationTest[
	ImportMarkdown["[link *foo **bar** `#`*](/uri)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link *foo **bar** `#`*", "/uri"}|>]}|>]},
	"TestID"->"Links-515"
	]

VerificationTest[
	ImportMarkdown["[link [foo [bar]]](/uri)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link [foo [bar]]", "/uri"}|>]}|>]},
	"TestID"->"Links-511"
	]

VerificationTest[
	ImportMarkdown["[link](#fragment)\n\n[link](http://example.com#fragment)\n\n[link](http://example.com?foo=3#frag)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "#fragment"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "http://example.com#fragment"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "http://example.com?foo=3#frag"}|>]}|>]},
	"TestID"->"Links-500"
	]

VerificationTest[
	ImportMarkdown["[link](</my uri>)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "</my uri>"}|>]}|>]},
	"TestID"->"Links-488"
	]

VerificationTest[
	ImportMarkdown["[link](/my uri)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "/my uri"}|>]}|>]},
	"TestID"->"Links-487"
	]

VerificationTest[
	ImportMarkdown["[link](\"title\")\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "\"title\""}|>]}|>]},
	"TestID"->"Links-503"
	]

VerificationTest[
	ImportMarkdown["[link] (/uri)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[link] (/uri)"|>]},
	"TestID"->"Links-510"
	]

VerificationTest[
	ImportMarkdown["[link](/uri)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "/uri"}|>]}|>]},
	"TestID"->"Links-482"
	]

VerificationTest[
	ImportMarkdown["[link](   /uri\n  \"title\"  )\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[link](   /uri"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  \"title\"  )"|>]},
	"TestID"->"Links-509"
	]

VerificationTest[
	ImportMarkdown["[link](/uri \"title\")\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "/uri \"title\""}|>]}|>]},
	"TestID"->"Links-481"
	]

VerificationTest[
	ImportMarkdown["[link](/url \"title\")\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "/url \"title\""}|>]}|>]},
	"TestID"->"Links-506"
	]

VerificationTest[
	ImportMarkdown["[link](/url \"title \"and\" title\")\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "/url \"title \"and\" title\""}|>]}|>]},
	"TestID"->"Links-507"
	]

VerificationTest[
	ImportMarkdown["[link](/url 'title \"and\" title')\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "/url 'title \"and\" title'"}|>]}|>]},
	"TestID"->"Links-508"
	]

VerificationTest[
	ImportMarkdown["[link](/url \"title\")\n[link](/url 'title')\n[link](/url (title))\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "/url \"title\""}|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "/url 'title'"}|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "/url (title"}|>], ")"}|>]},
	"TestID"->"Links-504"
	]

VerificationTest[
	ImportMarkdown["[link](/url \"title \\\"&quot;\")\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "/url \"title \\\"&quot;\""}|>]}|>]},
	"TestID"->"Links-505"
	]

VerificationTest[
	ImportMarkdown["[![moon](moon.jpg)][ref]\n\n[ref]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"![moon", "moon.jpg"}|>], "][ref]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref]: /uri"|>]},
	"TestID"->"Links-530"
	]

VerificationTest[
	ImportMarkdown["[![moon](moon.jpg)](/uri)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"![moon", "moon.jpg"}|>], "](/uri)"}|>]},
	"TestID"->"Links-516"
	]

VerificationTest[
	ImportMarkdown["[\:1e9e]\n\n[SS]: /url\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[\:1e9e]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[SS]: /url"|>]},
	"TestID"->"Links-539"
	]

VerificationTest[
	ImportMarkdown["[](./target.md)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[](./target.md)"|>]},
	"TestID"->"Links-483"
	]

VerificationTest[
	ImportMarkdown["[\n ]\n\n[\n ]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "["|>], MarkdownElement[<|"Element" -> "Line", "Data" -> " ]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "["|>], MarkdownElement[<|"Element" -> "Line", "Data" -> " ]: /uri"|>]},
	"TestID"->"Links-551"
	]

VerificationTest[
	ImportMarkdown["[]\n\n[]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[]: /uri"|>]},
	"TestID"->"Links-550"
	]


(* ------------------------------- List Items ------------------------------- *)
VerificationTest[
	ImportMarkdown["*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"List items-284"
	]

VerificationTest[
	ImportMarkdown["003. ok\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "003. ok"|>]},
	"TestID"->"List items-268"
	]

VerificationTest[
	ImportMarkdown["0. ok\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "ok"|>]},
	"TestID"->"List items-267"
	]

VerificationTest[
	ImportMarkdown["  10.  foo\n\n           bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "  10.  foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "       bar"|>]},
	"TestID"->"List items-271"
	]

VerificationTest[
	ImportMarkdown["10) foo\n    - bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "10) foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 2, "Data" -> "bar"|>]},
	"TestID"->"List items-296"
	]

VerificationTest[
	ImportMarkdown["10) foo\n   - bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "10) foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>]},
	"TestID"->"List items-297"
	]

VerificationTest[
	ImportMarkdown["1234567890. not ok\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "1234567890. not ok"|>]},
	"TestID"->"List items-266"
	]

VerificationTest[
	ImportMarkdown["123456789. ok\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "123456789. ok"|>]},
	"TestID"->"List items-265"
	]

VerificationTest[
	ImportMarkdown["1. - 2. foo\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "- 2. foo"|>]},
	"TestID"->"List items-299"
	]

VerificationTest[
	ImportMarkdown["  1.  A paragraph\n    with two lines.\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 1, "Data" -> " A paragraph"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "with two lines."|>]},
	"TestID"->"List items-291"
	]

VerificationTest[
	ImportMarkdown["    1.  A paragraph\n        with two lines.\n\n            indented code\n\n        > A block quote.\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 2, "Data" -> " A paragraph"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "    with two lines."|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "        indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "    > A block quote."|>]},
	"TestID"->"List items-289"
	]

VerificationTest[
	ImportMarkdown["   1.  A paragraph\n       with two lines.\n\n           indented code\n\n       > A block quote.\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "   1.  A paragraph"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "   with two lines."|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "       indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "   > A block quote."|>]},
	"TestID"->"List items-288"
	]

VerificationTest[
	ImportMarkdown["  1.  A paragraph\n      with two lines.\n\n          indented code\n\n      > A block quote.\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 1, "Data" -> " A paragraph"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  with two lines."|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "      indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  > A block quote."|>]},
	"TestID"->"List items-287"
	]

VerificationTest[
	ImportMarkdown["  1.  A paragraph\nwith two lines.\n\n          indented code\n\n      > A block quote.\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 1, "Data" -> " A paragraph"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "with two lines."|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "      indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  > A block quote."|>]},
	"TestID"->"List items-290"
	]

VerificationTest[
	ImportMarkdown[" 1.  A paragraph\n     with two lines.\n\n         indented code\n\n     > A block quote.\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> " 1.  A paragraph"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> " with two lines."|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "     indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> " > A block quote."|>]},
	"TestID"->"List items-286"
	]

VerificationTest[
	ImportMarkdown["1.  A paragraph\n    with two lines.\n\n        indented code\n\n    > A block quote.\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> " A paragraph"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "with two lines."|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "    indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "> A block quote."|>]},
	"TestID"->"List items-254"
	]

VerificationTest[
	ImportMarkdown["> 1. > Blockquote\n> continued here.\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "1. > Blockquote"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "continued here."|>]},
	"TestID"->"List items-293"
	]

VerificationTest[
	ImportMarkdown["> 1. > Blockquote\ncontinued here.\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "1. > Blockquote"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "continued here."|>]},
	"TestID"->"List items-292"
	]

VerificationTest[
	ImportMarkdown["1. foo\n2.\n3. bar\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "2."|>], MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "bar"|>]},
	"TestID"->"List items-283"
	]

VerificationTest[
	ImportMarkdown["1.  foo\n\n    ```\n    bar\n    ```\n\n    baz\n\n    > bam\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> " foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "baz"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "> bam"|>]},
	"TestID"->"List items-263"
	]

VerificationTest[
	ImportMarkdown["1.      indented code\n\n   paragraph\n\n       more code\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "     indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   paragraph"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "   more code"|>]},
	"TestID"->"List items-274"
	]

VerificationTest[
	ImportMarkdown["1.     indented code\n\n   paragraph\n\n       more code\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "    indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   paragraph"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "   more code"|>]},
	"TestID"->"List items-273"
	]

VerificationTest[
	ImportMarkdown["-1. not ok\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "-1. not ok"|>]},
	"TestID"->"List items-269"
	]

VerificationTest[
	ImportMarkdown["   > > 1.  one\n>>\n>>     two\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "   > > 1.  one"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> ">>"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> ">>     two"|>]},
	"TestID"->"List items-259"
	]

VerificationTest[
	ImportMarkdown["A paragraph\nwith two lines.\n\n    indented code\n\n> A block quote.\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "A paragraph"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "with two lines."|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "A block quote."|>]},
	"TestID"->"List items-253"
	]

VerificationTest[
	ImportMarkdown["-   \n  foo\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "  "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  foo"|>]},
	"TestID"->"List items-279"
	]

VerificationTest[
	ImportMarkdown["-\n\n  foo\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "-"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  foo"|>]},
	"TestID"->"List items-280"
	]

VerificationTest[
	ImportMarkdown["- - foo\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "- foo"|>]},
	"TestID"->"List items-298"
	]

VerificationTest[
	ImportMarkdown["-    foo\n\n  bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "   foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  bar"|>]},
	"TestID"->"List items-276"
	]

VerificationTest[
	ImportMarkdown["-  foo\n\n   bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> " foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   bar"|>]},
	"TestID"->"List items-277"
	]

VerificationTest[
	ImportMarkdown["   foo\n\nbar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "   foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>]},
	"TestID"->"List items-275"
	]

VerificationTest[
	ImportMarkdown["- foo\n-   \n- bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "  "|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>]},
	"TestID"->"List items-282"
	]

VerificationTest[
	ImportMarkdown["- foo\n\n      bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  bar"|>]},
	"TestID"->"List items-270"
	]

VerificationTest[
	ImportMarkdown["- foo\n-\n- bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "-"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>]},
	"TestID"->"List items-281"
	]

VerificationTest[
	ImportMarkdown["- foo\n\n\n  bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  bar"|>]},
	"TestID"->"List items-262"
	]

VerificationTest[
	ImportMarkdown["-\n  foo\n-\n  ```\n  bar\n  ```\n-\n      baz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "-"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "-"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "-"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  baz"|>]},
	"TestID"->"List items-278"
	]

VerificationTest[
	ImportMarkdown["- # Foo\n- Bar\n  ---\n  baz\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "# Foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "Bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  ---"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  baz"|>]},
	"TestID"->"List items-300"
	]

VerificationTest[
	ImportMarkdown["- Foo\n\n      bar\n\n\n      baz\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  bar"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  baz"|>]},
	"TestID"->"List items-264"
	]

VerificationTest[
	ImportMarkdown["- foo\n  - bar\n    - baz\n      - boo\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 2, "Data" -> "baz"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 3, "Data" -> "boo"|>]},
	"TestID"->"List items-294"
	]

VerificationTest[
	ImportMarkdown["- foo\n - bar\n  - baz\n   - boo\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "baz"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "boo"|>]},
	"TestID"->"List items-295"
	]

VerificationTest[
	ImportMarkdown["foo\n*\n\nfoo\n1.\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "1."|>]},
	"TestID"->"List items-285"
	]

VerificationTest[
	ImportMarkdown["    indented code\n\nparagraph\n\n    more code\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "paragraph"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "more code"|>]},
	"TestID"->"List items-272"
	]

VerificationTest[
	ImportMarkdown["-one\n\n2.two\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "-one"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "2.two"|>]},
	"TestID"->"List items-261"
	]

VerificationTest[
	ImportMarkdown[" -    one\n\n      two\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "   one"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  two"|>]},
	"TestID"->"List items-258"
	]

VerificationTest[
	ImportMarkdown[" -    one\n\n     two\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "   one"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> " two"|>]},
	"TestID"->"List items-257"
	]

VerificationTest[
	ImportMarkdown[">>- one\n>>\n  >  > two\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> ">>- one"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> ">>"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  >  > two"|>]},
	"TestID"->"List items-260"
	]

VerificationTest[
	ImportMarkdown["- one\n\n  two\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "one"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  two"|>]},
	"TestID"->"List items-256"
	]

VerificationTest[
	ImportMarkdown["- one\n\n two\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "one"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> " two"|>]},
	"TestID"->"List items-255"
	]

VerificationTest[
	ImportMarkdown["1. a\n\n  2. b\n\n    3. c\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "OrderedList", "Data" -> {MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 1, "Data" -> "b"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 2, "Data" -> "c"|>]},
	"TestID"->"Lists-313"
	]

VerificationTest[
	ImportMarkdown["1. a\n\n  2. b\n\n   3. c\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "OrderedList", "Data" -> {MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 1, "Data" -> "b"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   3. c"|>]},
	"TestID"->"Lists-311"
	]

VerificationTest[
	ImportMarkdown["1. foo\n2. bar\n3) baz\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "3) baz"|>]},
	"TestID"->"Lists-302"
	]

VerificationTest[
	ImportMarkdown["1. ```\n   foo\n   ```\n\n   bar\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"   ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   bar"|>]},
	"TestID"->"Lists-324"
	]

VerificationTest[
	ImportMarkdown["- a\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>]},
	"TestID"->"Lists-322"
	]

VerificationTest[
	ImportMarkdown["- a\n  - b\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "b"|>]},
	"TestID"->"Lists-323"
	]

VerificationTest[
	ImportMarkdown["- a\n- ```\n  b\n\n\n  ```\n- c\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  b"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "c"|>]},
	"TestID"->"Lists-318"
	]

VerificationTest[
	ImportMarkdown["* a\n  > b\n  >\n* c\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  > b"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  >"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "c"|>]},
	"TestID"->"Lists-320"
	]

VerificationTest[
	ImportMarkdown["- a\n- b\n\n- c\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "b"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "c"|>]},
	"TestID"->"Lists-314"
	]

VerificationTest[
	ImportMarkdown["- a\n  > b\n  ```\n  c\n  ```\n- d\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  > b"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  c"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "d"|>]},
	"TestID"->"Lists-321"
	]

VerificationTest[
	ImportMarkdown["- a\n  - b\n\n    c\n- d\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "b"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "c"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "d"|>]},
	"TestID"->"Lists-319"
	]

VerificationTest[
	ImportMarkdown["- a\n- b\n\n  c\n- d\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "b"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  c"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "d"|>]},
	"TestID"->"Lists-316"
	]

VerificationTest[
	ImportMarkdown["- a\n - b\n  - c\n   - d\n    - e\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "b"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "c"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "d"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 2, "Data" -> "e"|>]},
	"TestID"->"Lists-312"
	]

VerificationTest[
	ImportMarkdown["- a\n  - b\n  - c\n\n- d\n  - e\n  - f\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "b"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "c"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "d"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "e"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "f"|>]},
	"TestID"->"Lists-326"
	]

VerificationTest[
	ImportMarkdown["- a\n - b\n  - c\n   - d\n  - e\n - f\n- g\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "b"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "c"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "d"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "e"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "f"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "g"|>]},
	"TestID"->"Lists-310"
	]

VerificationTest[
	ImportMarkdown["- a\n- b\n\n  [ref]: /url\n- d\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "b"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  [ref]: /url"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "d"|>]},
	"TestID"->"Lists-317"
	]

VerificationTest[
	ImportMarkdown["* a\n*\n\n* c\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "c"|>]},
	"TestID"->"Lists-315"
	]

VerificationTest[
	ImportMarkdown["* foo\n  * bar\n\n  baz\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  baz"|>]},
	"TestID"->"Lists-325"
	]

VerificationTest[
	ImportMarkdown["- foo\n\n- bar\n\n\n- baz\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedList", "Data" -> {MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "baz"|>]},
	"TestID"->"Lists-306"
	]

VerificationTest[
	ImportMarkdown["- foo\n- bar\n+ baz\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "+ baz"|>]},
	"TestID"->"Lists-301"
	]

VerificationTest[
	ImportMarkdown["Foo\n- bar\n- baz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "baz"|>]},
	"TestID"->"Lists-303"
	]

VerificationTest[
	ImportMarkdown["- foo\n  - bar\n    - baz\n\n\n      bim\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 2, "Data" -> "baz"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  bim"|>]},
	"TestID"->"Lists-307"
	]

VerificationTest[
	ImportMarkdown["- foo\n- bar\n\n<!-- -->\n\n- baz\n- bim\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "!-- --"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "baz"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bim"|>]},
	"TestID"->"Lists-308"
	]

VerificationTest[
	ImportMarkdown["-   foo\n\n    notcode\n\n-   foo\n\n<!-- -->\n\n    code\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "  foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "notcode"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedList", "Data" -> {MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "  foo"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "!-- --"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "code"|>]},
	"TestID"->"Lists-309"
	]

VerificationTest[
	ImportMarkdown["The number of windows in my house is\n14.  The number of doors is 6.\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "The number of windows in my house is"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "14.  The number of doors is 6."|>]},
	"TestID"->"Lists-304"
	]

VerificationTest[
	ImportMarkdown["The number of windows in my house is\n1.  The number of doors is 6.\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "The number of windows in my house is"|>], MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> " The number of doors is 6."|>]},
	"TestID"->"Lists-305"
	]


(* ------------------------------- Paragraphs ------------------------------- *)
VerificationTest[
	ImportMarkdown["    aaa\nbbb\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb"|>]},
	"TestID"->"Paragraphs-225"
	]

VerificationTest[
	ImportMarkdown["   aaa\nbbb\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "   aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb"|>]},
	"TestID"->"Paragraphs-224"
	]

VerificationTest[
	ImportMarkdown["  aaa\n bbb\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "  aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> " bbb"|>]},
	"TestID"->"Paragraphs-222"
	]

VerificationTest[
	ImportMarkdown["aaa     \nbbb     \n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa     "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb     "|>]},
	"TestID"->"Paragraphs-226"
	]

VerificationTest[
	ImportMarkdown["aaa\n\n\nbbb\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb"|>]},
	"TestID"->"Paragraphs-221"
	]

VerificationTest[
	ImportMarkdown["aaa\n\nbbb\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb"|>]},
	"TestID"->"Paragraphs-219"
	]

VerificationTest[
	ImportMarkdown["aaa\n             bbb\n                                       ccc\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "         bbb"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "                                   ccc"|>]},
	"TestID"->"Paragraphs-223"
	]

VerificationTest[
	ImportMarkdown["aaa\nbbb\n\nccc\nddd\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "ccc"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "ddd"|>]},
	"TestID"->"Paragraphs-220"
	]


(* ------------------------------- Precedence ------------------------------- *)
VerificationTest[
	ImportMarkdown["- `one\n- two`\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "one"}|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {"two", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Precedence-42"
	]


(* -------------------------------- Raw HTML -------------------------------- *)
VerificationTest[
	ImportMarkdown["<33> <__>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "33"|>], " ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "__"|>]}|>]},
	"TestID"->"Raw HTML-617"
	]

VerificationTest[
	ImportMarkdown["<a/><b2/>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a/"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "b2/"|>]}|>]},
	"TestID"->"Raw HTML-613"
	]

VerificationTest[
	ImportMarkdown["<a  /><b2\ndata=\"foo\" >\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a  /"|>], "<b2"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "data=\"foo\" >"|>]},
	"TestID"->"Raw HTML-614"
	]

VerificationTest[
	ImportMarkdown["<a><bab><c2c>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "bab"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "c2c"|>]}|>]},
	"TestID"->"Raw HTML-612"
	]

VerificationTest[
	ImportMarkdown["</a></foo >\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/a"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/foo "|>]}|>]},
	"TestID"->"Raw HTML-622"
	]

VerificationTest[
	ImportMarkdown["<a foo=\"bar\" bam = 'baz <em>\"</em>'\n_boolean zoop:33=zoop:33 />\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a foo=\"bar\" bam = 'baz <em"|>], "\"", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/em"|>], "'"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], "boolean zoop:33=zoop:33 />"}|>]},
	"TestID"->"Raw HTML-615"
	]

VerificationTest[
	ImportMarkdown["< a><\nfoo><bar/ >\n<foo bar=baz\nbim!bop />\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> " a"|>], "<"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo>", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "bar/ "|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "<foo bar=baz"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bim!bop />"|>]},
	"TestID"->"Raw HTML-620"
	]

VerificationTest[
	ImportMarkdown["<a href=\"\\\"\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"\\\"\""|>]}|>]},
	"TestID"->"Raw HTML-632"
	]

VerificationTest[
	ImportMarkdown["<a href='bar'title=title>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href='bar'title=title"|>]}|>]},
	"TestID"->"Raw HTML-621"
	]

VerificationTest[
	ImportMarkdown["</a href=\"foo\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/a href=\"foo\""|>]}|>]},
	"TestID"->"Raw HTML-623"
	]

VerificationTest[
	ImportMarkdown["<a h*#ref=\"hi\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a h*#ref=\"hi\""|>]}|>]},
	"TestID"->"Raw HTML-618"
	]

VerificationTest[
	ImportMarkdown["<a href=\"hi'> <a href=hi'>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"hi'"|>], " ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=hi'"|>]}|>]},
	"TestID"->"Raw HTML-619"
	]

VerificationTest[
	ImportMarkdown["foo <a href=\"\\*\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"\\*\""|>]}|>]},
	"TestID"->"Raw HTML-631"
	]

VerificationTest[
	ImportMarkdown["foo <a href=\"&ouml;\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"&ouml;\""|>]}|>]},
	"TestID"->"Raw HTML-630"
	]

VerificationTest[
	ImportMarkdown["foo <![CDATA[>&<]]>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "![CDATA["|>], "&", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "]]"|>]}|>]},
	"TestID"->"Raw HTML-629"
	]

VerificationTest[
	ImportMarkdown["foo <!ELEMENT br EMPTY>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "!ELEMENT br EMPTY"|>]}|>]},
	"TestID"->"Raw HTML-628"
	]

VerificationTest[
	ImportMarkdown["foo <!--> foo -->\n\nfoo <!-- foo--->\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "!--"|>], " foo -->"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "!-- foo---"|>]}|>]},
	"TestID"->"Raw HTML-626"
	]

VerificationTest[
	ImportMarkdown["foo <!-- not a comment -- two hyphens -->\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "!-- not a comment -- two hyphens --"|>]}|>]},
	"TestID"->"Raw HTML-625"
	]

VerificationTest[
	ImportMarkdown["foo <?php echo $a; ?>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "?php echo $a; ?"|>]}|>]},
	"TestID"->"Raw HTML-627"
	]

VerificationTest[
	ImportMarkdown["Foo <responsive-image src=\"foo.jpg\" />\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"Foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "responsive-image src=\"foo.jpg\" /"|>]}|>]},
	"TestID"->"Raw HTML-616"
	]

VerificationTest[
	ImportMarkdown["foo <!-- this is a\ncomment - with hyphen -->\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo <!-- this is a"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "comment - with hyphen -->"|>]},
	"TestID"->"Raw HTML-624"
	]


(* ----------------------------- Setext headings ---------------------------- *)
VerificationTest[
	ImportMarkdown["\n====\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "===="|>]},
	"TestID"->"Setext headings-97"
	]

VerificationTest[
	ImportMarkdown["---\n---\n"],
	{MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>]},
	"TestID"->"Setext headings-98"
	]

VerificationTest[
	ImportMarkdown["    foo\n---\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>]},
	"TestID"->"Setext headings-100"
	]

VerificationTest[
	ImportMarkdown["\\> foo\n------\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "\\> foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "------"|>]},
	"TestID"->"Setext headings-102"
	]

VerificationTest[
	ImportMarkdown["- Foo\n---\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>]},
	"TestID"->"Setext headings-94"
	]

VerificationTest[
	ImportMarkdown["> Foo\n---\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>]},
	"TestID"->"Setext headings-92"
	]

VerificationTest[
	ImportMarkdown["- foo\n-----\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "-----"|>]},
	"TestID"->"Setext headings-99"
	]

VerificationTest[
	ImportMarkdown["> foo\n-----\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "-----"|>]},
	"TestID"->"Setext headings-101"
	]

VerificationTest[
	ImportMarkdown["Foo\\\n----\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo\\"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "----"|>]},
	"TestID"->"Setext headings-90"
	]

VerificationTest[
	ImportMarkdown["Foo\n    ---\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "---"|>]},
	"TestID"->"Setext headings-87"
	]

VerificationTest[
	ImportMarkdown["Foo  \n-----\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo  "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "-----"|>]},
	"TestID"->"Setext headings-89"
	]

VerificationTest[
	ImportMarkdown["Foo\n   ----      \n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   ----      "|>]},
	"TestID"->"Setext headings-86"
	]

VerificationTest[
	ImportMarkdown["`Foo\n----\n`\n\n<a title=\"a lot\n---\nof dashes\"/>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "Foo"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "----"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "<a title=\"a lot"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "of dashes\"/>"|>]},
	"TestID"->"Setext headings-91"
	]

VerificationTest[
	ImportMarkdown["> foo\nbar\n===\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "==="|>]},
	"TestID"->"Setext headings-93"
	]

VerificationTest[
	ImportMarkdown["Foo\nBar\n---\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "Bar"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>]},
	"TestID"->"Setext headings-95"
	]

VerificationTest[
	ImportMarkdown["---\nFoo\n---\nBar\n---\nBaz\n"],
	{MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "Bar"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "Baz"|>]},
	"TestID"->"Setext headings-96"
	]

VerificationTest[
	ImportMarkdown["  Foo *bar\nbaz*\t\n====\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"  Foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "bar"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"baz", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "\t"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "===="|>]},
	"TestID"->"Setext headings-82"
	]

VerificationTest[
	ImportMarkdown["Foo\n\nbar\n---\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Setext headings-103"
	]

VerificationTest[
	ImportMarkdown["Foo *bar\nbaz*\n====\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"Foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "bar"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"baz", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "===="|>]},
	"TestID"->"Setext headings-81"
	]

VerificationTest[
	ImportMarkdown["Foo\nbar\n* * *\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> " "|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Setext headings-105"
	]

VerificationTest[
	ImportMarkdown["Foo\nbar\n\n---\n\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Setext headings-104"
	]

VerificationTest[
	ImportMarkdown["Foo\nbar\n\\---\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "\\---"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Setext headings-106"
	]

VerificationTest[
	ImportMarkdown["Foo *bar*\n=========\n\nFoo *bar*\n---------\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"Foo ", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "========="|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"Foo ", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "---------"|>]},
	"TestID"->"Setext headings-80"
	]

VerificationTest[
	ImportMarkdown["    Foo\n    ---\n\n    Foo\n---\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "---"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>]},
	"TestID"->"Setext headings-85"
	]

VerificationTest[
	ImportMarkdown["Foo\n-------------------------\n\nFoo\n=\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "-------------------------"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "="|>]},
	"TestID"->"Setext headings-83"
	]

VerificationTest[
	ImportMarkdown["Foo\n= =\n\nFoo\n--- -\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "= ="|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "--- -"|>]},
	"TestID"->"Setext headings-88"
	]

VerificationTest[
	ImportMarkdown["   Foo\n---\n\n  Foo\n-----\n\n  Foo\n  ===\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "   Foo"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "-----"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  ==="|>]},
	"TestID"->"Setext headings-84"
	]


(* ---------------------------- Soft line breaks ---------------------------- *)
VerificationTest[
	ImportMarkdown["foo \n baz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> " baz"|>]},
	"TestID"->"Soft line breaks-649"
	]

VerificationTest[
	ImportMarkdown["foo\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Soft line breaks-648"
	]


(* ---------------------------------- Tabs ---------------------------------- *)
VerificationTest[
	ImportMarkdown["*\t*\t*\t\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "\t"|>], "\t"}|>]},
	"TestID"->"Tabs-11"
	]

VerificationTest[
	ImportMarkdown["    a\ta\n    \:1f50\ta\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "a\ta"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "\:1f50\ta"|>]},
	"TestID"->"Tabs-3"
	]

VerificationTest[
	ImportMarkdown["-\t\tfoo\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "\tfoo"|>]},
	"TestID"->"Tabs-7"
	]

VerificationTest[
	ImportMarkdown[">\t\tfoo\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "\tfoo"|>]},
	"TestID"->"Tabs-6"
	]

VerificationTest[
	ImportMarkdown["#\tFoo\n"],
	{MarkdownElement[<|"Element" -> "Heading", "Level" -> 1, "Data" -> "Foo"|>]},
	"TestID"->"Tabs-10"
	]

VerificationTest[
	ImportMarkdown["  - foo\n\n\tbar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "\tbar"|>]},
	"TestID"->"Tabs-4"
	]

VerificationTest[
	ImportMarkdown["    foo\n\tbar\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "\tbar"|>]},
	"TestID"->"Tabs-8"
	]

VerificationTest[
	ImportMarkdown["- foo\n\n\t\tbar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "\t\tbar"|>]},
	"TestID"->"Tabs-5"
	]

VerificationTest[
	ImportMarkdown[" - foo\n   - bar\n\t - baz\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "baz"|>]},
	"TestID"->"Tabs-9"
	]

VerificationTest[
	ImportMarkdown["  \tfoo\tbaz\t\tbim\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "  \tfoo\tbaz\t\tbim"|>]},
	"TestID"->"Tabs-2"
	]

VerificationTest[
	ImportMarkdown["\tfoo\tbaz\t\tbim\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "\tfoo\tbaz\t\tbim"|>]},
	"TestID"->"Tabs-1"
	]

(* ----------------------------- Textual Content ---------------------------- *)
VerificationTest[
	ImportMarkdown["Foo \[Chi]\[Rho]\:1fc6\[Nu]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo \[Chi]\[Rho]\:1fc6\[Nu]"|>]},
	"TestID"->"Textual content-651"
	]

VerificationTest[
	ImportMarkdown["hello $.;'there\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"hello ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "$"|>], ".;'there"}|>]},
	"TestID"->"Textual content-650"
	]

VerificationTest[
	ImportMarkdown["Multiple     spaces\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Multiple     spaces"|>]},
	"TestID"->"Textual content-652"
	]

(* ----------------------------- Thematic Breaks ---------------------------- *)
VerificationTest[
	ImportMarkdown["+++\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "+++"|>]},
	"TestID"->"Thematic breaks-44"
	]

VerificationTest[
	ImportMarkdown["===\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "==="|>]},
	"TestID"->"Thematic breaks-45"
	]

VerificationTest[
	ImportMarkdown[" *-*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {" ", MarkdownElement[<|"Element" -> "*", "Data" -> "-"|>]}|>]},
	"TestID"->"Thematic breaks-56"
	]

VerificationTest[
	ImportMarkdown[" - - -\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "- -"|>]},
	"TestID"->"Thematic breaks-51"
	]

VerificationTest[
	ImportMarkdown["    ***\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>]},
	"TestID"->"Thematic breaks-48"
	]

VerificationTest[
	ImportMarkdown["--\n**\n__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "--"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>]}|>]},
	"TestID"->"Thematic breaks-46"
	]

VerificationTest[
	ImportMarkdown["***\n---\n___\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "___"|>]}|>]},
	"TestID"->"Thematic breaks-43"
	]

VerificationTest[
	ImportMarkdown["- - - -    \n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "- - -    "|>]},
	"TestID"->"Thematic breaks-54"
	]

VerificationTest[
	ImportMarkdown[" ***\n  ***\n   ***\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {" ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"   ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>]},
	"TestID"->"Thematic breaks-47"
	]

VerificationTest[
	ImportMarkdown[" **  * ** * ** * **\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {" ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>]},
	"TestID"->"Thematic breaks-52"
	]

VerificationTest[
	ImportMarkdown["-     -      -      -\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "    -      -      -"|>]},
	"TestID"->"Thematic breaks-53"
	]

VerificationTest[
	ImportMarkdown["_____________________________________\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_____________________________________"|>]}|>]},
	"TestID"->"Thematic breaks-50"
	]

VerificationTest[
	ImportMarkdown["_ _ _ _ a\n\na------\n\n---a---\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> " "|>], " ", MarkdownElement[<|"Element" -> "_", "Data" -> " "|>], " a"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "a------"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "---a---"|>]},
	"TestID"->"Thematic breaks-55"
	]

VerificationTest[
	ImportMarkdown["- Foo\n- * * *\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Thematic breaks-61"
	]

VerificationTest[
	ImportMarkdown["Foo\n    ***\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>]},
	"TestID"->"Thematic breaks-49"
	]

VerificationTest[
	ImportMarkdown["* Foo\n* * *\n* Bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> " "|>]}|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "Bar"|>]},
	"TestID"->"Thematic breaks-60"
	]

VerificationTest[
	ImportMarkdown["- foo\n***\n- bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>]},
	"TestID"->"Thematic breaks-57"
	]

VerificationTest[
	ImportMarkdown["Foo\n***\nbar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>]},
	"TestID"->"Thematic breaks-58"
	]

VerificationTest[
	ImportMarkdown["Foo\n---\nbar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>]},
	"TestID"->"Thematic breaks-59"
	]

EndTestSection[]
