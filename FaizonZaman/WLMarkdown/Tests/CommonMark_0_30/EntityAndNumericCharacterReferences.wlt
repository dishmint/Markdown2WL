BeginTestSection["EntityAndNumericCharacterReference"]
(* ----------------- Entity and Numeric Character References ---------------- *)
(* https://spec.commonmark.org/0.30/#entity-and-numeric-character-references *)
TestCreate[
	ImportMarkdown["&#35; &#1234; &#992; &#0;\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "&#35; &#1234; &#992; &#0;"|>]},
	"TestID"->"Entity and numeric character references-26"
	]

TestCreate[
	ImportMarkdown["&#42;foo&#42;\n*foo*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "&#42;foo&#42;"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>]}|>]},
	"TestID"->"Entity and numeric character references-37"
	]

TestCreate[
	ImportMarkdown["&#42; foo\n\n* foo\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "&#42; foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>]},
	"TestID"->"Entity and numeric character references-38"
	]

TestCreate[
	ImportMarkdown["&#9;foo\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "&#9;foo"|>]},
	"TestID"->"Entity and numeric character references-40"
	]

TestCreate[
	ImportMarkdown["<a href=\"&ouml;&ouml;.html\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"&ouml;&ouml;.html\""|>]}|>]},
	"TestID"->"Entity and numeric character references-31"
	]

TestCreate[
	ImportMarkdown["[a](url &quot;tit&quot;)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"a", "url &quot;tit&quot;"}|>]}|>]},
	"TestID"->"Entity and numeric character references-41"
	]

TestCreate[
	ImportMarkdown["&copy\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "&copy"|>]},
	"TestID"->"Entity and numeric character references-29"
	]

TestCreate[
	ImportMarkdown["foo&#10;&#10;bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo&#10;&#10;bar"|>]},
	"TestID"->"Entity and numeric character references-39"
	]

TestCreate[
	ImportMarkdown["[foo]\n\n[foo]: /f&ouml;&ouml; \"f&ouml;&ouml;\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /f&ouml;&ouml; \"f&ouml;&ouml;\""|>]},
	"TestID"->"Entity and numeric character references-33"
	]

TestCreate[
	ImportMarkdown["[foo](/f&ouml;&ouml; \"f&ouml;&ouml;\")\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"foo", "/f&ouml;&ouml; \"f&ouml;&ouml;\""}|>]}|>]},
	"TestID"->"Entity and numeric character references-32"
	]

TestCreate[
	ImportMarkdown["    f&ouml;f&ouml;\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "f&ouml;f&ouml;"|>]},
	"TestID"->"Entity and numeric character references-36"
	]

TestCreate[
	ImportMarkdown["`f&ouml;&ouml;`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "`", "Data" -> "f&ouml;&ouml;"|>]}|>]},
	"TestID"->"Entity and numeric character references-35"
	]

TestCreate[
	ImportMarkdown["``` f&ouml;&ouml;\nfoo\n```\n"],
	{MarkdownElement[<|"Element" -> "CodeFence", "Data" -> " f&ouml;&ouml;"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>]},
	"TestID"->"Entity and numeric character references-34"
	]

TestCreate[
	ImportMarkdown["&MadeUpEntity;\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "&MadeUpEntity;"|>]},
	"TestID"->"Entity and numeric character references-30"
	]

TestCreate[
	ImportMarkdown["&nbsp; &amp; &copy; &AElig; &Dcaron;\n&frac34; &HilbertSpace; &DifferentialD;\n&ClockwiseContourIntegral; &ngE;\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "&nbsp; &amp; &copy; &AElig; &Dcaron;"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "&frac34; &HilbertSpace; &DifferentialD;"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "&ClockwiseContourIntegral; &ngE;"|>]},
	"TestID"->"Entity and numeric character references-25"
	]

TestCreate[
	ImportMarkdown["&nbsp &x; &#; &#x;\n&#87654321;\n&#abcdef0;\n&ThisIsNotDefined; &hi?;\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "&nbsp &x; &#; &#x;"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "&#87654321;"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "&#abcdef0;"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "&ThisIsNotDefined; &hi?;"|>]},
	"TestID"->"Entity and numeric character references-28"
	]

TestCreate[
	ImportMarkdown["&#X22; &#XD06; &#xcab;\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "&#X22; &#XD06; &#xcab;"|>]},
	"TestID"->"Entity and numeric character references-27"
	]

EndTestSection[]