(* ::Package:: *)

BeginPackage["FaizonZaman`WLMarkdown`"]

ImportMarkdown::usage = "ImportMarkdown[s] imports string s into symbolic markdown\nImportMarkdown[f] imports file f into symbolic markdown"
LineRules::usage = "LineRules[f] gives the line tokenization rules for Markdown flavor f"
LinkRules::usage = "LinkRules[f] gives the link tokenization rules for Markdown flavor f"
BlockRules::usage = "BlockRules[f] gives the block tokenization rules for Markdown flavor f"
DelimiterRules::usage = "DelimiterRules[f] gives the delimiter tokenization rules for Markdown flavor f"
TokenToElementRules::usage = "TokenToElementRules[f] gives the parser rules for Markdown flavor f"
MarkdownRules::usage = "MarkdownRules[f] gives the tokenization rules for Markdown flavor f"
MarkdownDelimiters::usage = "MarkdownDelimiters[f] gives the delimiters for Markdown flavor f"
MarkdownLexer::usage = "MarkdownLexer[s,r] lexes the string s with rules r\nMarkdownLexer[ls, r] lexes the list of strings ls with rules r"
MarkdownToken::usage = "Represents a lexed Markdown token"
MarkdownParser::usage = "MarkdownParser[tk,r] parses the token tk into symbolic markdown via the rules r\nMarkdownParser[tks, r] parses the list of tokens tks into symbolic markdown via the rules r"
MarkdownElement::usage = "Represents a symbolic Markdown element"

Begin["`Private`"]

Needs["FaizonZaman`WLMarkdown`TokenRules`"]
Needs["FaizonZaman`WLMarkdown`Lexer`"]
Needs["FaizonZaman`WLMarkdown`ElementRules`"]
Needs["FaizonZaman`WLMarkdown`Parser`"]

(* MarkdownRules *)
$MarkdownFlavors = Alternatives["CommonMark"]
MarkdownRules[flavor:$MarkdownFlavors] := AssociationThread[{"LineRules", "LinkRules", "BlockRules", "DelimiterRules", "ParserRules" } -> Through[{LineRules, LinkRules, BlockRules, DelimiterRules, ParserRules}[flavor]]]
MarkdownRules[flavor_] := (Message[MarkdownRules::invf, flavor];$Failed)
MarkdownRules::invf = "No line markdown rules defined for flavor \"``\""

(* ImportMarkdown *)
Options[ImportMarkdown] = {
	"Flavor" -> Automatic
};

ImportMarkdown[ string_String, opts:OptionsPattern[ ImportMarkdown ] ] := iImportMarkdown[ string, opts ]

ImportMarkdown[ file_File?FileExistsQ, opts:OptionsPattern[ ImportMarkdown ] ] := Module[
	{data = Import[ file, "Text" ]},
	iImportMarkdown[ data, opts ]
	]

iImportMarkdown[ source_String, opts:OptionsPattern[ ImportMarkdown ] ] :=
	Module[
		{
			lines = StringSplit[ source, "\n" ], tokens, trules, parse, prules,
			flavor = Replace[ OptionValue[ "Flavor" ], Automatic -> "CommonMark" ]
			},
		Enclose[
			Confirm[ lrules = LineRules[ flavor ], StringTemplate[ LineRules::invf ][ flavor ] ];
			Confirm[ hrules = LinkRules[ flavor ], StringTemplate[ LinkRules::invf ][ flavor ] ];
			Confirm[ brules = BlockRules[ flavor ], StringTemplate[ BlockRules::invf ][ flavor ] ];
			Confirm[ drules = DelimiterRules[ flavor ], StringTemplate[ DelimiterRules::invf ][ flavor ] ];
			Confirm[ erules = TokenToElementRules[ flavor ], StringTemplate[ TokenToElementRules::invf ][ flavor ] ];

			tokens = MarkdownLexer[ lines, AssociationThread[ { "LineRules", "LinkRules", "BlockRules", "DelimiterRules" } -> { lrules, hrules, brules, drules}]];

			parse  = MarkdownParser[tokens, erules]
		]
	]

End[]

EndPackage[]
