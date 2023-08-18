BeginTestSection["RawHTML"]
(* -------------------------------- Raw HTML -------------------------------- *)
(* --------------- https://spec.commonmark.org/0.30/#raw-html --------------- *)

TestCreate[
	ImportMarkdown["<33> <__>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "33"|>], " ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "__"|>]}|>]},
	"TestID"->"Raw HTML-617"
	]

TestCreate[
	ImportMarkdown["<a/><b2/>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a/"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "b2/"|>]}|>]},
	"TestID"->"Raw HTML-613"
	]

TestCreate[
	ImportMarkdown["<a  /><b2\ndata=\"foo\" >\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a  /"|>], "<b2"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "data=\"foo\" >"|>]},
	"TestID"->"Raw HTML-614"
	]

TestCreate[
	ImportMarkdown["<a><bab><c2c>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "bab"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "c2c"|>]}|>]},
	"TestID"->"Raw HTML-612"
	]

TestCreate[
	ImportMarkdown["</a></foo >\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/a"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/foo "|>]}|>]},
	"TestID"->"Raw HTML-622"
	]

TestCreate[
	ImportMarkdown["<a foo=\"bar\" bam = 'baz <em>\"</em>'\n_boolean zoop:33=zoop:33 />\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a foo=\"bar\" bam = 'baz <em"|>], "\"", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/em"|>], "'"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], "boolean zoop:33=zoop:33 />"}|>]},
	"TestID"->"Raw HTML-615"
	]

TestCreate[
	ImportMarkdown["< a><\nfoo><bar/ >\n<foo bar=baz\nbim!bop />\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> " a"|>], "<"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo>", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "bar/ "|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "<foo bar=baz"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bim!bop />"|>]},
	"TestID"->"Raw HTML-620"
	]

TestCreate[
	ImportMarkdown["<a href=\"\\\"\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"\\\"\""|>]}|>]},
	"TestID"->"Raw HTML-632"
	]

TestCreate[
	ImportMarkdown["<a href='bar'title=title>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href='bar'title=title"|>]}|>]},
	"TestID"->"Raw HTML-621"
	]

TestCreate[
	ImportMarkdown["</a href=\"foo\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/a href=\"foo\""|>]}|>]},
	"TestID"->"Raw HTML-623"
	]

TestCreate[
	ImportMarkdown["<a h*#ref=\"hi\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a h*#ref=\"hi\""|>]}|>]},
	"TestID"->"Raw HTML-618"
	]

TestCreate[
	ImportMarkdown["<a href=\"hi'> <a href=hi'>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"hi'"|>], " ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=hi'"|>]}|>]},
	"TestID"->"Raw HTML-619"
	]

TestCreate[
	ImportMarkdown["foo <a href=\"\\*\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"\\*\""|>]}|>]},
	"TestID"->"Raw HTML-631"
	]

TestCreate[
	ImportMarkdown["foo <a href=\"&ouml;\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"&ouml;\""|>]}|>]},
	"TestID"->"Raw HTML-630"
	]

TestCreate[
	ImportMarkdown["foo <![CDATA[>&<]]>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "![CDATA["|>], "&", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "]]"|>]}|>]},
	"TestID"->"Raw HTML-629"
	]

TestCreate[
	ImportMarkdown["foo <!ELEMENT br EMPTY>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "!ELEMENT br EMPTY"|>]}|>]},
	"TestID"->"Raw HTML-628"
	]

TestCreate[
	ImportMarkdown["foo <!--> foo -->\n\nfoo <!-- foo--->\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "!--"|>], " foo -->"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "!-- foo---"|>]}|>]},
	"TestID"->"Raw HTML-626"
	]

TestCreate[
	ImportMarkdown["foo <!-- not a comment -- two hyphens -->\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "!-- not a comment -- two hyphens --"|>]}|>]},
	"TestID"->"Raw HTML-625"
	]

TestCreate[
	ImportMarkdown["foo <?php echo $a; ?>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "?php echo $a; ?"|>]}|>]},
	"TestID"->"Raw HTML-627"
	]

TestCreate[
	ImportMarkdown["Foo <responsive-image src=\"foo.jpg\" />\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"Foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "responsive-image src=\"foo.jpg\" /"|>]}|>]},
	"TestID"->"Raw HTML-616"
	]

TestCreate[
	ImportMarkdown["foo <!-- this is a\ncomment - with hyphen -->\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo <!-- this is a"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "comment - with hyphen -->"|>]},
	"TestID"->"Raw HTML-624"
	]


EndTestSection[]