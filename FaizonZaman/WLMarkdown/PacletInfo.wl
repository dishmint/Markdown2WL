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
          (* CommonMark v0.30 Spec *)
          {"Tabs", "CommonMark_0_30/Tabs.wlt"},
          {"BackslashEscapes", "CommonMark_0_30/BackslashEscapes.wlt"},
          {"ATXHeadings", "CommonMark_0_30/ATXHeadings.wlt"},
          {"Autolinks", "CommonMark_0_30/Autolinks.wlt"},
          {"BlankLines", "CommonMark_0_30/BlankLines.wlt"},
          {"BlockQuotes", "CommonMark_0_30/BlockQuotes.wlt"},
          {"CodeSpans", "CommonMark_0_30/CodeSpans.wlt"},
          {"EmphasisAndStrongEmphasis", "CommonMark_0_30/EmphasisAndStrongEmphasis.wlt"},
          {"EntityAndNumericCharacterReferences", "CommonMark_0_30/EntityAndNumericCharacterReferences.wlt"},
          {"FencedCodeBlocks", "CommonMark_0_30/FencedCodeBlocks.wlt"},
          {"HardLineBreaks", "CommonMark_0_30/HardLineBreaks.wlt"},
          {"HTMLBlocks", "CommonMark_0_30/HTMLBlocks.wlt"},
          {"Images", "CommonMark_0_30/Images.wlt"},
          {"IndentedCodeBlocks", "CommonMark_0_30/IndentedCodeBlocks.wlt"},
          {"CommonMark_0_30", "CommonMark_0_30.wlt"}
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
