BeginTestSection["Headings"]
VerificationTest[
	ParseMarkdownString["# A Markdown Title"],
	{MarkdownElement["H1","A Markdown Title"]},
	"TestID" -> "H1Test"
	]
VerificationTest[
	ParseMarkdownString["## A Markdown Subtitle"],
	{MarkdownElement["H2","A Markdown Subtitle"]},
	"TestID" -> "H2Test"
	]
VerificationTest[
	ParseMarkdownString["### A Markdown Chapter"],
	{MarkdownElement["H3","A Markdown Chapter"]},
	"TestID" -> "H3Test"
	]
VerificationTest[
	ParseMarkdownString["#### A Markdown Section"],
	{MarkdownElement["H4","A Markdown Section"]},
	"TestID" -> "H4Test"
	]
VerificationTest[
	ParseMarkdownString["##### A Markdown Subsection"],
	{MarkdownElement["H5","A Markdown Subsection"]},
	"TestID" -> "H5Test"
	]
VerificationTest[
	ParseMarkdownString["###### A Markdown Subsubsection"],
	{MarkdownElement["H6","A Markdown Subsubsection"]},
	"TestID" -> "H6Test"
	]
VerificationTest[
	ParseMarkdownString["####### A Markdown Paragraph"],
	{"####### A Markdown Paragraph"},
	"TestID" -> "H7Test"
	]
EndTestSection[]
