BeginTestSection["Tokenizer"]
VerificationTest[
	TokenizeMarkdown["\n\nThis is a paragraph.\n\n"],
	{MarkdownToken["EmptyLine", {}], {"This is a paragraph."},MarkdownToken["EmptyLine", {}]},
	"TestID" -> "TokenizerParagraphTest1"
]

VerificationTest[
	TokenizeMarkdown["\n\nThis is a paragraph with _some_ text in *it*.\n\n"],
	{
		MarkdownToken["EmptyLine", {}],
		{"This is a paragraph with ",MarkdownToken["LFD", "_"], "some", MarkdownToken["RFD", "_"]," text in ", MarkdownToken["LFD", "*"], "it",MarkdownToken["RFD", "*"], "."},
		MarkdownToken["EmptyLine", {}]
		},
	"TestID" -> "TokenizerParagraphWithEmphasisTest1"
]

EndTestSection[]
