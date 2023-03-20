# **WLMarkdown** [WIP]

The goal of this repo is to establish Markdown Import and Export Converters as well as a standalone Markdown parser.

The default spec is CommonMark and is currently the only spec supported.

---
Installation:
1. Download the zip / .paclet archive
2. Open a WL notebook (Mathematica, WolframDesktop, WolframOne)
3. PacletInstall["path/to/.paclet"]
4. Needs["WLMarkdown`"]
5. Open ResourceDefinition.nb (which includes basic examples)
=======

Roadmap:
- [x] Implement MarkdownLexer
- [x] Implement MarkdownParser
- [ ] Add parser tests
- [ ] Publish to WPR
- [ ] Implement Import Converter
- [ ] Implement Export Converter
