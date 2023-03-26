(* ::Package:: *)

PacletObject[
  <|
    "Name" -> "FaizonZaman/WLMarkdown",
    "Description" -> "Parse markdown files into symbolic markdown",
    "Creator" -> "Faizon Zaman",
    "License" -> "MIT",
    "PublisherID" -> "FaizonZaman",
    "Version" -> "0.1.1",
    "WolframVersion" -> "13.0+",
    "Extensions" -> {
      {
        "Kernel",
        "Root" -> "Kernel",
        "Context" -> "FaizonZaman`WLMarkdown`",
        "Symbols" -> {
          "FaizonZaman`WLMarkdown`BlockRules",
          "FaizonZaman`WLMarkdown`DelimiterRules",
          "FaizonZaman`WLMarkdown`FaizonZaman`WLMarkdown`Utilities`GetIndentationLevel",
          "FaizonZaman`WLMarkdown`ImportMarkdown",
          "FaizonZaman`WLMarkdown`LineRules",
          "FaizonZaman`WLMarkdown`LinkRules",
          "FaizonZaman`WLMarkdown`MarkdownDelimiters",
          "FaizonZaman`WLMarkdown`MarkdownElement",
          "FaizonZaman`WLMarkdown`MarkdownLexer",
          "FaizonZaman`WLMarkdown`MarkdownParser",
          "FaizonZaman`WLMarkdown`MarkdownRules",
          "FaizonZaman`WLMarkdown`MarkdownToken"
        }
      },
      {
        "Resource",
        "Root" -> "Tests",
        "Resources" -> {
          (* WLMarkdown Components *)
          {"LineLexer", "LineLexer.wlt"},
          {"LinkLexer", "LinkLexer.wlt"},
          {"BlockLexer", "BlockLexer.wlt"},
          {"DelimiterLexer", "DelimiterLexer.wlt"},
          {"MarkdownLexer", "MarkdownLexer.wlt"},
          {"MarkdownParser", "MarkdownParser.wlt"},

          (*     CommonMark v0.30 Tests "https://spec.commonmark.org/0.30/spec.json"    *)
          {"Tabs", "CommonMark_0_30/Tabs.wlt"},
          {"BackslashEscapes", "CommonMark_0_30/BackslashEscapes.wlt"},
          {"EntityAndNumericCharacterReferences", "CommonMark_0_30/EntityAndNumericCharacterReferences.wlt"},
          {"Precedence", "CommonMark_0_30/Precedence.wlt"},
          {"ThematicBreaks", "CommonMark_0_30/ThematicBreaks.wlt"},
          {"ATXHeadings", "CommonMark_0_30/ATXHeadings.wlt"},
          {"SetextHeadings", "CommonMark_0_30/SetextHeadings.wlt"},
          {"IndentedCodeBlocks", "CommonMark_0_30/IndentedCodeBlocks.wlt"},
          {"FencedCodeBlocks", "CommonMark_0_30/FencedCodeBlocks.wlt"},
          {"HTMLBlocks", "CommonMark_0_30/HTMLBlocks.wlt"},
          {"LinkReferenceDefinitions", "CommonMark_0_30/LinkReferenceDefinitions.wlt"},
          {"Paragraphs", "CommonMark_0_30/Paragraphs.wlt"},
          {"BlankLines", "CommonMark_0_30/BlankLines.wlt"},
          {"BlockQuotes", "CommonMark_0_30/BlockQuotes.wlt"},
          {"ListItems", "CommonMark_0_30/ListItems.wlt"},
          {"Lists", "CommonMark_0_30/Lists.wlt"},
          {"Inlines", "CommonMark_0_30/Inlines.wlt"},
          {"CodeSpans", "CommonMark_0_30/CodeSpans.wlt"},
          {"EmphasisAndStrongEmphasis", "CommonMark_0_30/EmphasisAndStrongEmphasis.wlt"},
          {"Links", "CommonMark_0_30/Links.wlt"},
          {"Images", "CommonMark_0_30/Images.wlt"},
          {"Autolinks", "CommonMark_0_30/Autolinks.wlt"},
          {"RawHTML", "CommonMark_0_30/RawHTML.wlt"},
          {"HardLineBreaks", "CommonMark_0_30/HardLineBreaks.wlt"},
          {"SoftLineBreaks", "CommonMark_0_30/SoftLineBreaks.wlt"},
          {"TextualContent", "CommonMark_0_30/TextualContent.wlt"}
        }
      },
      {
        "Resource",
        "Root" -> "Examples",
        "Resources" -> {{"CommonMark", "CommonMark.md"}}
      },
      {"Documentation", "Language" -> "English"}
    }
  |>
]
