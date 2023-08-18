BeginTestSection["ListItems"]
(* ------------------------------- List Items ------------------------------- *)
(* -------------- https://spec.commonmark.org/0.30/#list-items -------------- *)

TestCreate[
	ImportMarkdown["*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"List items-284"
	]

TestCreate[
	ImportMarkdown["003. ok\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "003. ok"|>]},
	"TestID"->"List items-268"
	]

TestCreate[
	ImportMarkdown["0. ok\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "ok"|>]},
	"TestID"->"List items-267"
	]

TestCreate[
	ImportMarkdown["  10.  foo\n\n           bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "  10.  foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "       bar"|>]},
	"TestID"->"List items-271"
	]

TestCreate[
	ImportMarkdown["10) foo\n    - bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "10) foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 2, "Data" -> "bar"|>]},
	"TestID"->"List items-296"
	]

TestCreate[
	ImportMarkdown["10) foo\n   - bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "10) foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>]},
	"TestID"->"List items-297"
	]

TestCreate[
	ImportMarkdown["1234567890. not ok\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "1234567890. not ok"|>]},
	"TestID"->"List items-266"
	]

TestCreate[
	ImportMarkdown["123456789. ok\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "123456789. ok"|>]},
	"TestID"->"List items-265"
	]

TestCreate[
	ImportMarkdown["1. - 2. foo\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "- 2. foo"|>]},
	"TestID"->"List items-299"
	]

TestCreate[
	ImportMarkdown["  1.  A paragraph\n    with two lines.\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 1, "Data" -> " A paragraph"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "with two lines."|>]},
	"TestID"->"List items-291"
	]

TestCreate[
	ImportMarkdown["    1.  A paragraph\n        with two lines.\n\n            indented code\n\n        > A block quote.\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 2, "Data" -> " A paragraph"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "    with two lines."|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "        indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "    > A block quote."|>]},
	"TestID"->"List items-289"
	]

TestCreate[
	ImportMarkdown["   1.  A paragraph\n       with two lines.\n\n           indented code\n\n       > A block quote.\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "   1.  A paragraph"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "   with two lines."|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "       indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "   > A block quote."|>]},
	"TestID"->"List items-288"
	]

TestCreate[
	ImportMarkdown["  1.  A paragraph\n      with two lines.\n\n          indented code\n\n      > A block quote.\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 1, "Data" -> " A paragraph"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  with two lines."|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "      indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  > A block quote."|>]},
	"TestID"->"List items-287"
	]

TestCreate[
	ImportMarkdown["  1.  A paragraph\nwith two lines.\n\n          indented code\n\n      > A block quote.\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 1, "Data" -> " A paragraph"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "with two lines."|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "      indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  > A block quote."|>]},
	"TestID"->"List items-290"
	]

TestCreate[
	ImportMarkdown[" 1.  A paragraph\n     with two lines.\n\n         indented code\n\n     > A block quote.\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> " 1.  A paragraph"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> " with two lines."|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "     indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> " > A block quote."|>]},
	"TestID"->"List items-286"
	]

TestCreate[
	ImportMarkdown["1.  A paragraph\n    with two lines.\n\n        indented code\n\n    > A block quote.\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> " A paragraph"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "with two lines."|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "    indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "> A block quote."|>]},
	"TestID"->"List items-254"
	]

TestCreate[
	ImportMarkdown["> 1. > Blockquote\n> continued here.\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "1. > Blockquote"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "continued here."|>]},
	"TestID"->"List items-293"
	]

TestCreate[
	ImportMarkdown["> 1. > Blockquote\ncontinued here.\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "1. > Blockquote"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "continued here."|>]},
	"TestID"->"List items-292"
	]

TestCreate[
	ImportMarkdown["1. foo\n2.\n3. bar\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "2."|>], MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "bar"|>]},
	"TestID"->"List items-283"
	]

TestCreate[
	ImportMarkdown["1.  foo\n\n    ```\n    bar\n    ```\n\n    baz\n\n    > bam\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> " foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "baz"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "> bam"|>]},
	"TestID"->"List items-263"
	]

TestCreate[
	ImportMarkdown["1.      indented code\n\n   paragraph\n\n       more code\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "     indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   paragraph"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "   more code"|>]},
	"TestID"->"List items-274"
	]

TestCreate[
	ImportMarkdown["1.     indented code\n\n   paragraph\n\n       more code\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "    indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   paragraph"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "   more code"|>]},
	"TestID"->"List items-273"
	]

TestCreate[
	ImportMarkdown["-1. not ok\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "-1. not ok"|>]},
	"TestID"->"List items-269"
	]

TestCreate[
	ImportMarkdown["   > > 1.  one\n>>\n>>     two\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "   > > 1.  one"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> ">>"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> ">>     two"|>]},
	"TestID"->"List items-259"
	]

TestCreate[
	ImportMarkdown["A paragraph\nwith two lines.\n\n    indented code\n\n> A block quote.\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "A paragraph"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "with two lines."|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "A block quote."|>]},
	"TestID"->"List items-253"
	]

TestCreate[
	ImportMarkdown["-   \n  foo\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "  "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  foo"|>]},
	"TestID"->"List items-279"
	]

TestCreate[
	ImportMarkdown["-\n\n  foo\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "-"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  foo"|>]},
	"TestID"->"List items-280"
	]

TestCreate[
	ImportMarkdown["- - foo\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "- foo"|>]},
	"TestID"->"List items-298"
	]

TestCreate[
	ImportMarkdown["-    foo\n\n  bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "   foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  bar"|>]},
	"TestID"->"List items-276"
	]

TestCreate[
	ImportMarkdown["-  foo\n\n   bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> " foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   bar"|>]},
	"TestID"->"List items-277"
	]

TestCreate[
	ImportMarkdown["   foo\n\nbar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "   foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>]},
	"TestID"->"List items-275"
	]

TestCreate[
	ImportMarkdown["- foo\n-   \n- bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "  "|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>]},
	"TestID"->"List items-282"
	]

TestCreate[
	ImportMarkdown["- foo\n\n      bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  bar"|>]},
	"TestID"->"List items-270"
	]

TestCreate[
	ImportMarkdown["- foo\n-\n- bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "-"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>]},
	"TestID"->"List items-281"
	]

TestCreate[
	ImportMarkdown["- foo\n\n\n  bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  bar"|>]},
	"TestID"->"List items-262"
	]

TestCreate[
	ImportMarkdown["-\n  foo\n-\n  ```\n  bar\n  ```\n-\n      baz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "-"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "-"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "-"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  baz"|>]},
	"TestID"->"List items-278"
	]

TestCreate[
	ImportMarkdown["- # Foo\n- Bar\n  ---\n  baz\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "# Foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "Bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  ---"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  baz"|>]},
	"TestID"->"List items-300"
	]

TestCreate[
	ImportMarkdown["- Foo\n\n      bar\n\n\n      baz\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  bar"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  baz"|>]},
	"TestID"->"List items-264"
	]

TestCreate[
	ImportMarkdown["- foo\n  - bar\n    - baz\n      - boo\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 2, "Data" -> "baz"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 3, "Data" -> "boo"|>]},
	"TestID"->"List items-294"
	]

TestCreate[
	ImportMarkdown["- foo\n - bar\n  - baz\n   - boo\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "baz"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "boo"|>]},
	"TestID"->"List items-295"
	]

TestCreate[
	ImportMarkdown["foo\n*\n\nfoo\n1.\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "1."|>]},
	"TestID"->"List items-285"
	]

TestCreate[
	ImportMarkdown["    indented code\n\nparagraph\n\n    more code\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "paragraph"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "more code"|>]},
	"TestID"->"List items-272"
	]

TestCreate[
	ImportMarkdown["-one\n\n2.two\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "-one"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "2.two"|>]},
	"TestID"->"List items-261"
	]

TestCreate[
	ImportMarkdown[" -    one\n\n      two\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "   one"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  two"|>]},
	"TestID"->"List items-258"
	]

TestCreate[
	ImportMarkdown[" -    one\n\n     two\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "   one"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> " two"|>]},
	"TestID"->"List items-257"
	]

TestCreate[
	ImportMarkdown[">>- one\n>>\n  >  > two\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> ">>- one"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> ">>"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  >  > two"|>]},
	"TestID"->"List items-260"
	]

TestCreate[
	ImportMarkdown["- one\n\n  two\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "one"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  two"|>]},
	"TestID"->"List items-256"
	]

TestCreate[
	ImportMarkdown["- one\n\n two\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "one"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> " two"|>]},
	"TestID"->"List items-255"
	]

EndTestSection[]