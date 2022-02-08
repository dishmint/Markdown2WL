BeginTestSection["Lists"]

(* UnorderedListItems *)
VerificationTest[
	TokenizeMarkdownString["* hello"],
	{MarkdownElement["Item", <|"Type" -> "Unordered", "IndentationLevel" -> 0,"IndentationType" -> None, "Text" -> {"hello"}|>]},
	"TestID" -> "UnorderedListItemTest1"
]

VerificationTest[
	TokenizeMarkdownString["  * hello"],
	{MarkdownElement["Item", <|"Type" -> "Unordered", "IndentationLevel" -> 1,"IndentationType" -> "Whitespace", "Text" -> {"hello"}|>]},
	"TestID" -> "UnorderedListItemTest2"
]

VerificationTest[
	TokenizeMarkdownString["    * hello"],
	{MarkdownElement["Item", <|"Type" -> "Unordered", "IndentationLevel" -> 2,"IndentationType" -> "Whitespace", "Text" -> {"hello"}|>]},
	"TestID" -> "UnorderedListItemTest3"
]

VerificationTest[
	TokenizeMarkdownString["\t* hello"],
	{MarkdownElement["Item", <|"Type" -> "Unordered", "IndentationLevel" -> 1,"IndentationType" -> "Tabs", "Text" -> {"hello"}|>]},
	"TestID" -> "UnorderedListItemTest4"
]

VerificationTest[
	TokenizeMarkdownString["\t\t* hello"],
	{MarkdownElement["Item", <|"Type" -> "Unordered", "IndentationLevel" -> 2,"IndentationType" -> "Tabs", "Text" -> {"hello"}|>]},
	"TestID" -> "UnorderedListItemTest5"
]

VerificationTest[
	TokenizeMarkdownString["\t\t\t* hello"],
	{MarkdownElement["Item", <|"Type" -> "Unordered", "IndentationLevel" -> 3,"IndentationType" -> "Tabs", "Text" -> {"hello"}|>]},
	"TestID" -> "UnorderedListItemTest6"
]


EndTestSection[]
