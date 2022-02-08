(* Italics, Bold, InlineCode, BlockQuote, HorizontalLine*)

BeginTestSection["Emphasis"]

(* Italics *)
VerificationTest[
	TokenizeMarkdownString["_still_"],
	{MarkdownElement[Italic, {"still"}]},
	"TestID" -> "ItalicUnderscoreTest1"
	]

VerificationTest[
	TokenizeMarkdownString["_still the clouds rain_"],
	{MarkdownElement[Italic, {"still the clouds rain"}]},
	"TestID" -> "ItalicUnderscoreTest2"
	]

VerificationTest[
	TokenizeMarkdownString["_still  _ the clouds * rain_"],
	{MarkdownElement[Italic, {"still  _ the clouds * rain"}]},
	"TestID" -> "ItalicUnderscoreTest3"
	]

VerificationTest[
	TokenizeMarkdownString["*nicely*"],
	{MarkdownElement[Italic, {"nicely"}]},
	"TestID" -> "ItalicAsteriskTest1"
	]

VerificationTest[
	TokenizeMarkdownString["*nicely done!*"],
	{MarkdownElement[Italic, {"nicely done!"}]},
	"TestID" -> "ItalicAsteriskTest2"
	]

VerificationTest[
	TokenizeMarkdownString["*nicely _ * done!*"],
	{MarkdownElement[Italic, {"nicely _ * done!"}]},
	"TestID" -> "ItalicAsteriskTest2"
	]

(* Bold *)
VerificationTest[
	TokenizeMarkdownString["__still__"],
	{MarkdownElement[Bold, {"still"}]},
	"TestID" -> "BoldUnderscoreTest1"
	]

VerificationTest[
	TokenizeMarkdownString["__still the clouds rain__"],
	{MarkdownElement[Bold, {"still the clouds rain"}]},
	"TestID" -> "BoldUnderscoreTest2"
	]

VerificationTest[
	TokenizeMarkdownString["__still  _ the clouds * rain__"],
	{MarkdownElement[Bold, {"still  _ the clouds * rain"}]},
	"TestID" -> "BoldUnderscoreTest3"
	]

VerificationTest[
	TokenizeMarkdownString["**nicely**"],
	{MarkdownElement[Bold, {"nicely"}]},
	"TestID" -> "BoldAsteriskTest1"
	]

VerificationTest[
	TokenizeMarkdownString["**nicely done!**"],
	{MarkdownElement[Bold, {"nicely done!"}]},
	"TestID" -> "BoldAsteriskTest2"
	]

VerificationTest[
	TokenizeMarkdownString["**nicely _ * done!**"],
	{MarkdownElement[Bold, {"nicely _ * done!"}]},
	"TestID" -> "BoldAsteriskTest2"
	]

VerificationTest[
	TokenizeMarkdownString["hello _there **friend**_"],
	{"hello ", MarkdownElement[Italic, {"there ", MarkdownElement[Bold,{"friend"}]}]},
	"TestID" -> "NestedEmphasisTest1"
	]

(* InlineCode *)
VerificationTest[
	TokenizeMarkdownString["`inline code`"],
	{MarkdownElement["InlineCode", "inline code"]},
	"TestID" -> "InlineCodeTest1"
	]

VerificationTest[
	TokenizeMarkdownString["`f[n__Integer] := List[n]`"],
	{MarkdownElement["InlineCode", "f[n__Integer] := List[n]"]},
	"TestID" -> "InlineCodeTest2"
	]

(* BlockQuote *)
VerificationTest[
	TokenizeMarkdownString["> A blockquote"],
	{MarkdownElement["BlockQuote", {"A blockquote"}]},
	"TestID" -> "BlockQuoteTest1"
	]

VerificationTest[
	TokenizeMarkdownString["  * > A blockquote"],
	{
		MarkdownElement[
			"Item",
			<|
				"Type" -> "Unordered",
				"IndentationLevel" -> 1,
				"IndentationType" -> "Whitespace",
				"Text" -> {MarkdownElement["BlockQuote", {"A blockquote"}]}
				|>
			]
		},
	"TestID" -> "BlockQuoteTest2"
	]

(* HorizontalLine *)
VerificationTest[
	TokenizeMarkdownString["---"],
	{MarkdownElement["HorizontalLine"]},
	"TestID" -> "HorizontalLineTest1"
	]

EndTestSection[]
