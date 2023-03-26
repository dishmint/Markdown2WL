BeginTestSection["FencedCodeBlocks"]
(* ---------------------------- Fenced Codeblocks --------------------------- *)
(* ---------- https://spec.commonmark.org/0.30/#fenced-code-blocks ---------- *)

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

EndTestSection[]