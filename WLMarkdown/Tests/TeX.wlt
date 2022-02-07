BeginTestSection["TeX"]
VerificationTest[
	ParseMarkdownString["\\(a^2 + b^2 = c^2\\)"],
	{MarkdownElement["LaTeX", <|"Type" -> "Inline", "Body" -> "a^2 + b^2 = c^2"|>]},
	"TestID" -> "InlineTeXTest1"
]

VerificationTest[
	ParseMarkdownString["$ a^2 + b^2 = c^2 $"],
	{MarkdownElement["LaTeX", <|"Type" -> "Inline", "Body" -> " a^2 + b^2 = c^2 "|>]},
	"TestID" -> "InlineTeXTest2"
]

VerificationTest[
	ParseMarkdownString["\[ a^n + b^n = c^n \]"],
	{MarkdownElement["LaTeX", <|"Type" -> "Display", "Body" -> "a^n + b^n = c^n"|>]},
	"TestID" -> "DisplayTeXTest1"
]

VerificationTest[
	ParseMarkdownString["$$ a^2 + b^2 = c^2 $$"],
	{MarkdownElement["LaTeX", <|"Type" -> "Display", "Body" -> " a^2 + b^2 = c^2 "|>]},
	"TestID" -> "DisplayTeXTest2"
]

EndTestSection[]
