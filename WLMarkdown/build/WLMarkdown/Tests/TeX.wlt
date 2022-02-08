BeginTestSection["TeX"]

VerificationTest[
	TokenizeMarkdownString["$$ a^2 + b^2 = c^2 $$"],
	{MarkdownElement["LaTeX", <|"Type" -> "Display", "Body" -> " a^2 + b^2 = c^2 "|>]},
	"TestID" -> "TeX1Test1"
]

VerificationTest[
	TokenizeMarkdownString["\[ a^n + b^n = c^n \]"],
	{MarkdownElement["LaTeX", <|"Type" -> "Display", "Body" -> "a^n + b^n = c^n"|>]},
	"TestID" -> "TeX2Test1"
]

VerificationTest[
	TokenizeMarkdownString["$ a^2 + b^2 = c^2 $"],
	{MarkdownElement["LaTeX", <|"Type" -> "Inline", "Body" -> " a^2 + b^2 = c^2 "|>]},
	"TestID" -> "TeX3Test1"
]

VerificationTest[
	TokenizeMarkdownString["\\(a^2 + b^2 = c^2\\)"],
	{MarkdownElement["LaTeX", <|"Type" -> "Inline", "Body" -> "a^2 + b^2 = c^2"|>]},
	"TestID" -> "TeX4Test1"
]

EndTestSection[]
