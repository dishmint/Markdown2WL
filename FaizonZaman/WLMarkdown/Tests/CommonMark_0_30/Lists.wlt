BeginTestSection["Lists"]
(* ---------------------------------- Lists --------------------------------- *)

TestCreate[
	ImportMarkdown["1. a\n\n  2. b\n\n    3. c\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "OrderedList", "Data" -> {MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 1, "Data" -> "b"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 2, "Data" -> "c"|>]},
	"TestID"->"Lists-313"
	]

TestCreate[
	ImportMarkdown["1. a\n\n  2. b\n\n   3. c\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "OrderedList", "Data" -> {MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 1, "Data" -> "b"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   3. c"|>]},
	"TestID"->"Lists-311"
	]

TestCreate[
	ImportMarkdown["1. foo\n2. bar\n3) baz\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "3) baz"|>]},
	"TestID"->"Lists-302"
	]

TestCreate[
	ImportMarkdown["1. ```\n   foo\n   ```\n\n   bar\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"   ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   bar"|>]},
	"TestID"->"Lists-324"
	]

TestCreate[
	ImportMarkdown["- a\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>]},
	"TestID"->"Lists-322"
	]

TestCreate[
	ImportMarkdown["- a\n  - b\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "b"|>]},
	"TestID"->"Lists-323"
	]

TestCreate[
	ImportMarkdown["- a\n- ```\n  b\n\n\n  ```\n- c\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  b"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "c"|>]},
	"TestID"->"Lists-318"
	]

TestCreate[
	ImportMarkdown["* a\n  > b\n  >\n* c\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  > b"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  >"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "c"|>]},
	"TestID"->"Lists-320"
	]

TestCreate[
	ImportMarkdown["- a\n- b\n\n- c\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "b"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "c"|>]},
	"TestID"->"Lists-314"
	]

TestCreate[
	ImportMarkdown["- a\n  > b\n  ```\n  c\n  ```\n- d\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  > b"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  c"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "d"|>]},
	"TestID"->"Lists-321"
	]

TestCreate[
	ImportMarkdown["- a\n  - b\n\n    c\n- d\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "b"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "c"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "d"|>]},
	"TestID"->"Lists-319"
	]

TestCreate[
	ImportMarkdown["- a\n- b\n\n  c\n- d\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "b"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  c"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "d"|>]},
	"TestID"->"Lists-316"
	]

TestCreate[
	ImportMarkdown["- a\n - b\n  - c\n   - d\n    - e\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "b"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "c"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "d"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 2, "Data" -> "e"|>]},
	"TestID"->"Lists-312"
	]

TestCreate[
	ImportMarkdown["- a\n  - b\n  - c\n\n- d\n  - e\n  - f\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "b"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "c"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "d"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "e"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "f"|>]},
	"TestID"->"Lists-326"
	]

TestCreate[
	ImportMarkdown["- a\n - b\n  - c\n   - d\n  - e\n - f\n- g\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "b"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "c"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "d"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "e"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "f"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "g"|>]},
	"TestID"->"Lists-310"
	]

TestCreate[
	ImportMarkdown["- a\n- b\n\n  [ref]: /url\n- d\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "b"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  [ref]: /url"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "d"|>]},
	"TestID"->"Lists-317"
	]

TestCreate[
	ImportMarkdown["* a\n*\n\n* c\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "c"|>]},
	"TestID"->"Lists-315"
	]

TestCreate[
	ImportMarkdown["* foo\n  * bar\n\n  baz\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  baz"|>]},
	"TestID"->"Lists-325"
	]

TestCreate[
	ImportMarkdown["- foo\n\n- bar\n\n\n- baz\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedList", "Data" -> {MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "baz"|>]},
	"TestID"->"Lists-306"
	]

TestCreate[
	ImportMarkdown["- foo\n- bar\n+ baz\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "+ baz"|>]},
	"TestID"->"Lists-301"
	]

TestCreate[
	ImportMarkdown["Foo\n- bar\n- baz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "baz"|>]},
	"TestID"->"Lists-303"
	]

TestCreate[
	ImportMarkdown["- foo\n  - bar\n    - baz\n\n\n      bim\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 2, "Data" -> "baz"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  bim"|>]},
	"TestID"->"Lists-307"
	]

TestCreate[
	ImportMarkdown["- foo\n- bar\n\n<!-- -->\n\n- baz\n- bim\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "!-- --"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "baz"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bim"|>]},
	"TestID"->"Lists-308"
	]

TestCreate[
	ImportMarkdown["-   foo\n\n    notcode\n\n-   foo\n\n<!-- -->\n\n    code\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "  foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "notcode"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedList", "Data" -> {MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "  foo"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "!-- --"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "code"|>]},
	"TestID"->"Lists-309"
	]

TestCreate[
	ImportMarkdown["The number of windows in my house is\n14.  The number of doors is 6.\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "The number of windows in my house is"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "14.  The number of doors is 6."|>]},
	"TestID"->"Lists-304"
	]

TestCreate[
	ImportMarkdown["The number of windows in my house is\n1.  The number of doors is 6.\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "The number of windows in my house is"|>], MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> " The number of doors is 6."|>]},
	"TestID"->"Lists-305"
	]

EndTestSection[]