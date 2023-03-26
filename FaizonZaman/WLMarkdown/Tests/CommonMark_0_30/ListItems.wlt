BeginTestSection["ListItems"]
(* ------------------------------- List Items ------------------------------- *)
(* -------------- https://spec.commonmark.org/0.30/#list-items -------------- *)

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

EndTestSection[]