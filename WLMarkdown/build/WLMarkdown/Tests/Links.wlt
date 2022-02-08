BeginTestSection["Links"]
VerificationTest[
	TokenizeMarkdownString["[A link](https://www.example.com)"],
	{MarkdownElement[Hyperlink, <|"Label" -> {"A link"},"URL" -> "https://www.example.com"|>]},
	"TestID" -> "Link1Test1"
	]

VerificationTest[
	TokenizeMarkdownString["<https://www.example.com>"],
	{MarkdownElement[Hyperlink, <|"URL" -> "https://www.example.com"|>]},
	"TestID" -> "Link2Test1"
	]

VerificationTest[
	TokenizeMarkdownString["![Image Alt-text](https://www.example.com/path/to/image.png)"],
	{MarkdownElement[Hyperlink, <|"AltText" -> "Image Alt-text", "URL" -> "https://www.example.com/path/to/image.png"|>]},
	"TestID" -> "Link3Test1"
	]

EndTestSection[]
