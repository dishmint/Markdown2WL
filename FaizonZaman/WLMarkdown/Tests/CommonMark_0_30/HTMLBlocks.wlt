BeginTestSection["HTMLBlocks"]
(* ------------------------------- HTMLBlocks ------------------------------- *)
(* https://spec.commonmark.org/0.30/#html-blocks *)
TestCreate[
	ImportMarkdown["<a href=\"foo\">\n*bar*\n</a>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"foo\""|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/a"|>]}|>]},
	"TestID"->"HTML blocks-162"
	]

TestCreate[
	ImportMarkdown["<![CDATA[\nfunction matchwo(a,b)\n{\n  if (a < b && a < 0) then {\n    return 1;\n\n  } else {\n\n    return 0;\n  }\n}\n]]>\nokay\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<![CDATA["|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "function matchwo(a,b)"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "{"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  if (a < b && a < 0) then {"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "return 1;"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  } else {"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "return 0;"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  }"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "}"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "]]>"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "okay"|>]},
	"TestID"->"HTML blocks-182"
	]

TestCreate[
	ImportMarkdown["<del>\n\n*foo*\n\n</del>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "del"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/del"|>]}|>]},
	"TestID"->"HTML blocks-167"
	]

TestCreate[
	ImportMarkdown["<del>\n*foo*\n</del>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "del"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/del"|>]}|>]},
	"TestID"->"HTML blocks-166"
	]

TestCreate[
	ImportMarkdown["<del>*foo*</del>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "del"|>], MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/del"|>]}|>]},
	"TestID"->"HTML blocks-168"
	]

TestCreate[
	ImportMarkdown["<div><a href=\"bar\">*foo*</a></div>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "div"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"bar\""|>], MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/a"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/div"|>]}|>]},
	"TestID"->"HTML blocks-159"
	]

TestCreate[
	ImportMarkdown["<div>\nbar\n</div>\n*foo*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "div"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/div"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>]}|>]},
	"TestID"->"HTML blocks-186"
	]

TestCreate[
	ImportMarkdown["<div class\nfoo\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<div class"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>]},
	"TestID"->"HTML blocks-157"
	]

TestCreate[
	ImportMarkdown["<DIV CLASS=\"foo\">\n\n*Markdown*\n\n</DIV>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "DIV CLASS=\"foo\""|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "Markdown"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/DIV"|>]}|>]},
	"TestID"->"HTML blocks-152"
	]

TestCreate[
	ImportMarkdown["  <div>\n\n    <div>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "div"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "<div>"|>]},
	"TestID"->"HTML blocks-184"
	]

TestCreate[
	ImportMarkdown["<div></div>\n``` c\nint x = 33;\n```\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "div"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/div"|>]}|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> " c"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "int x = 33;"|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>]},
	"TestID"->"HTML blocks-161"
	]

TestCreate[
	ImportMarkdown["<div>\n\n*Emphasized* text.\n\n</div>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "div"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "Emphasized"|>], " text."}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/div"|>]}|>]},
	"TestID"->"HTML blocks-188"
	]

TestCreate[
	ImportMarkdown["<div>\n*Emphasized* text.\n</div>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "div"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "Emphasized"|>], " text."}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/div"|>]}|>]},
	"TestID"->"HTML blocks-189"
	]

TestCreate[
	ImportMarkdown["- <div>\n- foo\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "div"|>]}|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>]},
	"TestID"->"HTML blocks-175"
	]

TestCreate[
	ImportMarkdown["</div>\n*foo*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/div"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>]}|>]},
	"TestID"->"HTML blocks-151"
	]

TestCreate[
	ImportMarkdown["<div *???-&&&-<---\n*foo*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"<div ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "???-&&&-<---"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>]}|>]},
	"TestID"->"HTML blocks-158"
	]

TestCreate[
	ImportMarkdown["> <div>\n> foo\n\nbar\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "<div>"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>]},
	"TestID"->"HTML blocks-174"
	]

TestCreate[
	ImportMarkdown["<div>\n*foo*\n\n*bar*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "div"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>]}|>]},
	"TestID"->"HTML blocks-155"
	]

TestCreate[
	ImportMarkdown[" <div>\n  *hello*\n         <foo><a>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {" ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "div"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "*", "Data" -> "hello"|>]}|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "     <foo><a>"|>]},
	"TestID"->"HTML blocks-150"
	]

TestCreate[
	ImportMarkdown["<div id=\"foo\" class=\"bar\n  baz\">\n</div>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<div id=\"foo\" class=\"bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  baz\">"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/div"|>]}|>]},
	"TestID"->"HTML blocks-154"
	]

TestCreate[
	ImportMarkdown["<div id=\"foo\"\n  class=\"bar\">\n</div>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<div id=\"foo\""|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  class=\"bar\">"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/div"|>]}|>]},
	"TestID"->"HTML blocks-153"
	]

TestCreate[
	ImportMarkdown["<div id=\"foo\"\n*hi*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<div id=\"foo\""|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "hi"|>]}|>]},
	"TestID"->"HTML blocks-156"
	]

TestCreate[
	ImportMarkdown["<!DOCTYPE html>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "!DOCTYPE html"|>]}|>]},
	"TestID"->"HTML blocks-181"
	]

TestCreate[
	ImportMarkdown["Foo\n<a href=\"bar\">\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"bar\""|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"HTML blocks-187"
	]

TestCreate[
	ImportMarkdown["<!-- foo -->*bar*\n*baz*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "!-- foo --"|>], MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "baz"|>]}|>]},
	"TestID"->"HTML blocks-177"
	]

TestCreate[
	ImportMarkdown["<!-- Foo\n\nbar\n   baz -->\nokay\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<!-- Foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   baz -->"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "okay"|>]},
	"TestID"->"HTML blocks-179"
	]

TestCreate[
	ImportMarkdown["Foo\n<div>\nbar\n</div>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "div"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/div"|>]}|>]},
	"TestID"->"HTML blocks-185"
	]

TestCreate[
	ImportMarkdown["  <!-- foo -->\n\n    <!-- foo -->\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "!-- foo --"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "<!-- foo -->"|>]},
	"TestID"->"HTML blocks-183"
	]

TestCreate[
	ImportMarkdown["<i class=\"foo\">\n*bar*\n</i>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "i class=\"foo\""|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/i"|>]}|>]},
	"TestID"->"HTML blocks-164"
	]

TestCreate[
	ImportMarkdown["</ins>\n*bar*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/ins"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>]}|>]},
	"TestID"->"HTML blocks-165"
	]

TestCreate[
	ImportMarkdown["<?php\n\n  echo '>';\n\n?>\nokay\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<?php"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  echo '>';"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "?>"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "okay"|>]},
	"TestID"->"HTML blocks-180"
	]

TestCreate[
	ImportMarkdown["<pre language=\"haskell\"><code>\nimport Text.HTML.TagSoup\n\nmain :: IO ()\nmain = print $ parseTags tags\n</code></pre>\nokay\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "pre language=\"haskell\""|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "code"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "import Text.HTML.TagSoup"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "main :: IO ()"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"main = print ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "$"|>], " parseTags tags"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/code"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/pre"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "okay"|>]},
	"TestID"->"HTML blocks-169"
	]

TestCreate[
	ImportMarkdown["<script>\nfoo\n</script>1. *bar*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "script"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/script"|>], "1. ", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>]}|>]},
	"TestID"->"HTML blocks-178"
	]

TestCreate[
	ImportMarkdown["<script type=\"text/javascript\">\n// JavaScript example\n\ndocument.getElementById(\"demo\").innerHTML = \"Hello JavaScript!\";\n</script>\nokay\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "script type=\"text/javascript\""|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "// JavaScript example"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "document.getElementById(\"demo\").innerHTML = \"Hello JavaScript!\";"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/script"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "okay"|>]},
	"TestID"->"HTML blocks-170"
	]

TestCreate[
	ImportMarkdown["<style>p{color:red;}</style>\n*foo*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "style"|>], "p{color:red;}", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/style"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>]}|>]},
	"TestID"->"HTML blocks-176"
	]

TestCreate[
	ImportMarkdown["<style\n  type=\"text/css\">\n\nfoo\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<style"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  type=\"text/css\">"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>]},
	"TestID"->"HTML blocks-173"
	]

TestCreate[
	ImportMarkdown["<style\n  type=\"text/css\">\nh1 {color:red;}\n\np {color:blue;}\n</style>\nokay\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<style"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  type=\"text/css\">"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "h1 {color:red;}"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "p {color:blue;}"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/style"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "okay"|>]},
	"TestID"->"HTML blocks-172"
	]

TestCreate[
	ImportMarkdown["<table><tr><td>\nfoo\n</td></tr></table>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "table"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "tr"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "td"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/td"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/tr"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/table"|>]}|>]},
	"TestID"->"HTML blocks-160"
	]

TestCreate[
	ImportMarkdown["<table>\n\n  <tr>\n\n    <td>\n      Hi\n    </td>\n\n  </tr>\n\n</table>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "table"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "tr"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "<td>"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  Hi"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "</td>"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/tr"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/table"|>]}|>]},
	"TestID"->"HTML blocks-191"
	]

TestCreate[
	ImportMarkdown["<table>\n\n<tr>\n\n<td>\nHi\n</td>\n\n</tr>\n\n</table>\n"],
	MarkdownParser[FaizonZaman`WLMarkdown`Lexer`Private`DelimiterLexer[{MarkdownToken[<|"Token" -> "Line", "Data" -> {MarkdownToken[<|"Token" -> "Hyperlink", "Data" -> "table"|>]}|>], MarkdownToken[<|"Token" -> "EmptyLine"|>], MarkdownToken[<|"Token" -> "Line", "Data" -> {MarkdownToken[<|"Token" -> "Hyperlink", "Data" -> "tr"|>]}|>], {MarkdownToken[<|"Token" -> "EmptyLine"|>], MarkdownToken[<|"Token" -> "Line", "Data" -> {MarkdownToken[<|"Token" -> "Hyperlink", "Data" -> "td"|>]}|>], MarkdownToken[<|"Token" -> "Line", "Data" -> "Hi"|>], MarkdownToken[<|"Token" -> "Line", "Data" -> {MarkdownToken[<|"Token" -> "Hyperlink", "Data" -> "/td"|>]}|>], MarkdownToken[<|"Token" -> "EmptyLine"|>]}, MarkdownToken[<|"Token" -> "Line", "Data" -> {MarkdownToken[<|"Token" -> "Hyperlink", "Data" -> "/tr"|>]}|>], MarkdownToken[<|"Token" -> "EmptyLine"|>], MarkdownToken[<|"Token" -> "Line", "Data" -> {MarkdownToken[<|"Token" -> "Hyperlink", "Data" -> "/table"|>]}|>]}, {FaizonZaman`WLMarkdown`TokenRules`Private`d:"*" | "_" | "`" | "\\[" | "\\]" | "$" | "\\(" | "\\)" :> FaizonZaman`WLMarkdown`TokenRules`Private`$TokenData[Association["Token" -> "Delimiter", "Data" -> FaizonZaman`WLMarkdown`TokenRules`Private`d]]}], {MarkdownToken[KeyValuePattern[{"Token" -> FaizonZaman`WLMarkdown`ElementRules`Private`token_, "Level" -> FaizonZaman`WLMarkdown`ElementRules`Private`level_, "Data" -> FaizonZaman`WLMarkdown`ElementRules`Private`data_}]] :> FaizonZaman`WLMarkdown`ElementRules`$ElementLevelData[Association["Element" -> FaizonZaman`WLMarkdown`ElementRules`Private`token, "Level" -> FaizonZaman`WLMarkdown`ElementRules`Private`level, "Data" -> FaizonZaman`WLMarkdown`ElementRules`Private`data]], MarkdownToken[KeyValuePattern[{"Token" -> FaizonZaman`WLMarkdown`ElementRules`Private`token_, "Data" -> FaizonZaman`WLMarkdown`ElementRules`Private`data_}]] :> FaizonZaman`WLMarkdown`ElementRules`$ElementData[Association["Element" -> FaizonZaman`WLMarkdown`ElementRules`Private`token, "Data" -> FaizonZaman`WLMarkdown`ElementRules`Private`data]], MarkdownToken[KeyValuePattern[{"Token" -> FaizonZaman`WLMarkdown`ElementRules`Private`token_}]] :> FaizonZaman`WLMarkdown`ElementRules`$Element[Association["Element" -> FaizonZaman`WLMarkdown`ElementRules`Private`token]]}],
	"TestID"->"HTML blocks-190"
	]

TestCreate[
	ImportMarkdown["<table>\n  <tr>\n    <td>\n           hi\n    </td>\n  </tr>\n</table>\n\nokay.\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "table"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "tr"|>]}|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "<td>"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "       hi"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "</td>"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/tr"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/table"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "okay."|>]},
	"TestID"->"HTML blocks-149"
	]

TestCreate[
	ImportMarkdown["<table><tr><td>\n<pre>\n**Hello**,\n\n_world_.\n</pre>\n</td></tr></table>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "table"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "tr"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "td"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "pre"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> "Hello"|>], ","}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "world"|>], "."}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/pre"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/td"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/tr"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/table"|>]}|>]},
	"TestID"->"HTML blocks-148"
	]

TestCreate[
	ImportMarkdown["<textarea>\n\n*foo*\n\n_bar_\n\n</textarea>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "textarea"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "bar"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/textarea"|>]}|>]},
	"TestID"->"HTML blocks-171"
	]

TestCreate[
	ImportMarkdown["<Warning>\n*bar*\n</Warning>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "Warning"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/Warning"|>]}|>]},
	"TestID"->"HTML blocks-163"
	]


EndTestSection[]