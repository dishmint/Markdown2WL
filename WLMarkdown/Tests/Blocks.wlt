(* Tables, CodeBlocks*)
BeginTestSection["Blocks"]

(* Tables *)
VerificationTest[
	TokenizeMarkdownBlock["\n_still_ | `renders` | _nicely_\n:--- | :---: | ---:\n1 | 2 | 3\n"],
	{
	MarkdownElement[
	"Table",
	<|
		"Headers" -> {{MarkdownElement[Italic, {"still"}]," "}, {" ", MarkdownElement["InlineCode", "renders"]," "}, {" ", MarkdownElement[Italic, {"nicely"}]}},
		"Alignment" -> {Left, Center, Right},
		"Rows" -> {{{"1 "}, {" 2 "}, {" 3"}}}
		|>
	]
	},
	"TestID" -> "TableTest1"
]

(* CodeBlocks *)
VerificationTest[
	TokenizeMarkdownBlock["```Mathematica\nf[0] = 1\nf[1] = 1\nf[n_Integer] := f[n - 1] + f[n - 2]\n```"],
	{MarkdownElement["CodeBlock", <|"Language" -> "Mathematica", "Body" ->"\nf[0] = 1\nf[1] = 1\nf[n_Integer] := f[n - 1] + f[n - 2]\n"|>]},
	"TestID" -> "CodeBlock1Test1"
]

VerificationTest[
	TokenizeMarkdownBlock["```\nA code block\nwith text in it\n```"],
	{MarkdownElement["CodeBlock", <|"Language" -> "None", "Body" -> "A code block\nwith text in it"|>]},
	"TestID" -> "CodeBlock2Test1"
]

VerificationTest[
	TokenizeMarkdownBlock["
    A code block
    with text in it

"],
	{MarkdownElement["CodeBlock",Association["Language" -> "None","Body" -> "    A code block\n    with text in it\n"]]},
	"TestID" -> "CodeBlock3Test1"
]

VerificationTest[
	TokenizeMarkdownBlock["\n\n\tA code block\n\twith text in it\n\n"],
	{MarkdownElement["CodeBlock",Association["Language" -> "None","Body" -> "\tA code block\n\twith text in it\n"]]},
	"TestID" -> "CodeBlock3Test2"
]


EndTestSection[]
