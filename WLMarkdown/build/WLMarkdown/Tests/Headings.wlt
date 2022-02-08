BeginTestSection["Headings"]
VerificationTest[
	TokenizeMarkdownString["# A Markdown Title"],
	{MarkdownElement["H1",{"A Markdown Title"}]},
	"TestID" -> "H1Test"
	]
VerificationTest[
	TokenizeMarkdownString["## A Markdown Subtitle"],
	{MarkdownElement["H2",{"A Markdown Subtitle"}]},
	"TestID" -> "H2Test"
	]
VerificationTest[
	TokenizeMarkdownString["### A Markdown Chapter"],
	{MarkdownElement["H3",{"A Markdown Chapter"}]},
	"TestID" -> "H3Test"
	]
VerificationTest[
	TokenizeMarkdownString["#### A Markdown Section"],
	{MarkdownElement["H4",{"A Markdown Section"}]},
	"TestID" -> "H4Test"
	]
VerificationTest[
	TokenizeMarkdownString["##### A Markdown Subsection"],
	{MarkdownElement["H5",{"A Markdown Subsection"}]},
	"TestID" -> "H5Test"
	]
VerificationTest[
	TokenizeMarkdownString["###### A Markdown Subsubsection"],
	{MarkdownElement["H6",{"A Markdown Subsubsection"}]},
	"TestID" -> "H6Test"
	]
VerificationTest[
	TokenizeMarkdownString["####### A Markdown Paragraph"],
	{"####### A Markdown Paragraph"},
	"TestID" -> "H7Test"
	]
EndTestSection[]
