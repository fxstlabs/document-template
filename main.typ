#import "/meta/template.typ": *
#show: template

#show figure.where(
  kind: "example"
): set figure(supplement: "Example")

#let example-box(cpt, ..content) = figure(
  kind: "example",
  caption: cpt,
  box(
    stroke: 0.1em + black,
    inset: 2em,
    outset: -1em,
    width: 1fr,
    radius: 0.25em,
    fill: none,
    align(left)[
      *Example*
      #content.pos().join()
    ]
  )
)

#import "/blocks/notes.typ": *
#import "/blocks/tables.typ": *

= About This Template
This document constitutes the official, general-purpose FXST document template. All FXST documentation must adhere to the guidelines outlined herein to ensure consistency across all official works.

This Typst template incorporates various utilities to minimize the effort required to comply with style guidelines. Included are:

- Predefined functions to wrap or generate document units.
- Automatic styling with `set` and `show` rules.
- Help from libraries such as _zero_ @typst-zero and _codly_ @typst-codly to achieve a consistent look.
- _YAML_ files to generate document metadata, the author list, the bibliography and a glossary.

As document styling is largely automated, this document outlines guidelines for manual content creation and elements not currently automated.

= Document metadata
It is important for any document to include coherent and functional metadata for use in Assistive Technology and Software Scanning. Please edit the file `/resources/document.yaml` to accurately reflect your intentions with the document.

= Headings
To facilitate reader comprehension and navigation, all content must be organized under appropriate headings according to the following guidelines:

/ Document Title: A concise and descriptive representation of the document's purpose. The title should enable immediate assessment of the document's relevance. To set the document title, edit `/resources/document.yaml`.

/ Sections: Delimiters for distinct topics. A document may address various subjects related to a central theme. Major subject shifts require separate top-level sections, accompanied by concise headings introducing the topic.

/ Subsections: Delimiters for partitioning complex content into logical units. Subsections are recommended when a section exceeds visual density thresholds or introduces multiple sub-topics. Consider subdividing section content if the following conditions are met:

#align(center,
  table(
    columns: 2,
    table.header(strong[Element], strong[Threshold]),
    table.hline(),
    [Topics], [Greater than 3 topics.],
    [Paragraphs], [Greater than 6 paragraphs.],
  )
)

= Text
Textual content requires meticulous formatting to maintain a professional standard. Formatting nuances significantly impact readability and flow. The following details text formatting standards and their applications:

/ Italicized Text: Highlights entities of foreign origin or those requiring context. Examples include:

- The full name of a technical or specialized term that may require further definition.
  - Veterinarians assess feline health via the @feline-bcs.
- Citations of foreign works. Note that this does not negate the requirement for proper referencing.
  - According to _Can Cats Eat Salami?_, "Cats can have a little salami" @cats-salami.
- Formatting scientific names. See @format-scientific-names
  - The scientific name of domestic house cats is _Felis catus_.

/ Boldface Text: should not be used for body text formatting.

/ Strikethrough Text: should not be used for body text formatting.

/ Underlined Text: should only be used to highlight links and anchors. See @format-external-links.

/ Raw Text: Used to display code as well as inputs or outputs of a computer process. See @format-code-blocks for more information.

= Layouts, Figures and Models
Efficient organization of visuals and data enables rapid information retrieval. The following guidelines prescribe formatting for tables, graphs, images, and other models.

== Tables
Tables structure data to define relationships between elements. All tables must adhere to the following default format:

#figure(
  caption: "User guidelines for all tables.",
  align(center,
    table(
      columns: 2,
      table.header([Target], [Style Guideline]),
      [*Top Headers*], [
        - Always use `table.header` to mark your headers #footnote[This ensures proper support for Assistive Technologies and allows seamless continuation of headers on other pages if the table gets cut-off].
      ],
      [*Side Headers*], [
        - Side headers are optional and reserved for rows containing non-numeric, classifying labels #footnote[A classifying label relates objects (e.g., 'color', 'model', 'capacity').].
      ],
      [*Cell Alignment*], [
        - Cell alignment depends on the table type. Consult @format-special-tables for specific use cases.
        - For use cases not covered here, default to left alignment.
        - To propose a new standard, please contact #link("mailto:support@fxst.tech").
      ],
      [*Referentiability*], [
        - All tables must be wrapped in a `figure` block with an appropriate corresponding caption.
      ]
    )
  )
) <format-base-tables-rules>

=== Formatting Specialized Tables <format-special-tables>

Certain tables utilize specialized formatting for enhanced readability. These guidelines supplement the base rules in @format-base-tables-rules.

/ Comparison Tables: Compare multiple items across a specific set of characteristics.

#align(center,
  table(
    columns: 2,
    table.header([Target], [Style Guideline]),
    [*Top Headers*], [
      - The top headers must include the names of the entries that are being compared.
    ],
    [*Side Headers*], [
      - Side headers must be positioned on the left.
      - The side headers must include the characteristics that are being compared accross entries.
    ],
    [*Cell Alignment*], [
      - Left headers must be right-aligned.
      - The rest of the content must be center-aligned.
    ]
  )
)

#note-hint("Comparison Table Wrapper")[
  To expedite compliant formatting, wrap the table in the `comparison-table` wrapper provided in `/blocks/tables.typ`. See @example-comparison-table for an example:
]

#figure(
  caption: [Example usage of `comparison-table`.],
  align(center, 
    comparison-table(table(
      columns: 5,
      table.header([], [Lucky], [Whiskers], [Waffle], [Snickers Bar]),
      [Fur Color], [Orange], [Brown], [Black], [White],
      [Age (Years)], [1], [2], [2], [0.3],
      [\# Prev. Owners], [0], [2], [1], [0],
      [Attitude], [Grateful], [Needy], [Sweet], [Chaotic],
    ))
  )
) <example-comparison-table>

/ Numeric Data Tables: Represent numeric data across experiments, records, and results.

#align(center,
  table(
    columns: 2,
    table.header([Target], [Style Guideline]),
    [*Top Headers*], [
      - Top headers must include the name or symbol of the measurement.
      - If the measurement has a unit, it must be included.
      - If the measurement has a base different from $10$, it must be included.
    ],
    [*Cell Alignment*], [
      - All non-numeric data must be left-aligned.
      - All numeric data must be right-aligned as well as decimal-aligned.
    ]
  )
)

#note-hint("Numeric Table Wrapper")[
  To expedite compliant formatting, wrap the table in the `numeric-table` wrapper provided in `/blocks/tables.typ`. See @example-numeric-table for an example.
]

#note-informative("Wrapper Arguments")[
  This wrapper requires the `is-numeric` argument: an array of booleans mapping to columns positionally. This designates numeric columns for automatic formatting application.
]

#figure(
  caption: "Numeric data table example.",
  align(center, 
    numeric-table((false, false, true, true), table(
      columns: 4,
      table.header([Experiment No.],	[Sample Id], [Concentration of $"HCl (M)"$],	[Reaction Time]),
      [1],	[Sample A], [0.500], [142.352],
      [1],	[Sample B], [0.500], [141.894],
      [1],	[Sample C], [0.500], [143.011],
      [2],	[Sample A], [1.000], [72.105],
      [2],	[Sample B], [1.000], [71.948],
      [2],	[Sample C], [1.000], [72.412],
      [3],	[Sample A], [1.500], [48.223],
      [3],	[Sample B], [1.500], [47.981],
      [3],	[Sample C], [1.500], [48.556],
    ))
  )
) <example-numeric-table>

#note-technical([Generation of @example-numeric-table])[
  For reference, @example-numeric-table was generated using `numeric-table((false, false, true, true), table(...)`: two non-numeric columns (Integer sequences or ennumerations) and two numeric columns.
]

== Figures

Figures encompass all visual elements excluding tables. All figures must include a descriptive caption and sequential numbering. Examples include:

- Photographs
- Graphs (line graphs, bar graphs, etc.)
- Charts (flowcharts, pie charts, organizational charts)
- Drawings or illustrations
- Diagrams
- Maps
- Infographics

#figure(
  caption: [(Example) A sleeping cat @eepy-cat.],
  image(
    "resources/images/cat-pic.jpg",
    width: 50%
  )
) <example-figures>

== Lists
List styling is fully automated.

== Raw Text Blocks <format-code-blocks>
Raw text blocks display unformatted text, suitable for code and process I/O. These blocks are automatically styled by the _codly_ Typst package @typst-codly.

For code blocks, assign the figure supplement "Code Block". Otherwise, "Raw Text Block" is automatically applied.

#note-technical([About the "Code Block" supplement])[
  To automatically format supplements as "Code Block", set the figure `kind` to `"code"`.
  
  Automatic detection based on the `lang` key is currently unsupported due to technical limitations.
]

#figure(
  caption: [Example of using raw text to display code.],
  kind: "code",
  ```python
  def main():
    meow_count = int(input("Meow? "))
    for i in range(meow_count):
      print("meow")

  if __name__ == "__main__":
    main()
  ```
)

#figure(
  caption: [Example of using raw text to display input and/or output.],
  ```
  Meow? 3
  meow
  meow
  meow
  ```
)

= Hints

== Notes
Notes distinguish critical information through visual emphasis. This template provides six note types via `note-[note type]` functions, accepting a title and body. Custom blocks can be defined using `block-raw` from `/blocks/notes.typ`.

#note-informative("This note is informative")[Important but non-critical information. Use `note-informative`.]

#note-hint("This note is a hint")[Indicates alternatives, quality-of-life features, or conveniences. Use `note-hint`.]

#note-technical("This note is aimed at technical users")[Discusses technical details irrelevant to the general end-user. Use `note-technical`.]

#note-preferred("This note is for good practices")[Guides users towards recommended practices. Use `note-preferred`.]

#note-warning("This note is a warning")[Advises caution regarding potential risks. Use `note-warning`.]

#note-critical("This note has critical information")[Contains critical information; failure to observe may result in severe consequences. Use sparingly to maintain significance (`note-critical`).]

== Glossary
This template leverages the _glossy_ Typst package @typst-glossy to render a functional glossary, providing a simplified interface for the end user.

To define a glossary entry, edit `/resources/glossary.yaml`. Entries defined therein become automatically referentiable via their assigned YAML keys. For details, consult _glossy_'s #link("https://typst.app/universe/package/glossy", text(fill: blue)[documentation]).

Furthermore, this template provides a `references` key, which accepts bibliography keys in the event a glossary definition requires an external reference.

== Footnotes
Given the glossary functionality, footnotes should be restricted to providing context. Definitions of foreign terms must be placed in the glossary.

= Referencing Works
== Links <format-external-links>
All links should be underlined. All links to external content must also be written using blue text. This does not apply to references.

== Authors
Authors must be listed in `/resources/authors.yaml`. Supported keys include name, alias, website, email, and external links with icons. For supported icons, visit #link("https://simpleicons.org/", text(fill: blue)[Simple Icons]) and use the provided _slug_ as the YAML key. Refer to the template's author file for configuration examples.

== Bibliography
Bibliographies adhere to the IEEE style. Add entries to `/resources/bibliography.yaml` in #link("https://github.com/typst/hayagriva", text(fill: blue, emph[Hayagriva])) format. Entries are referenced using their assigned YAML keys and will appear in the bibliography upon citation.

== Quotes
Quotes follow #link("https://sdu-kz.libguides.com/ieee/in-text", text(fill: blue)[IEEE style]).

= Formatting Special Terms and Tokens
== Scientific Names <format-scientific-names>
Scientific names follow binomial nomenclature (Genus species): italicize both parts, capitalize the Genus, and use lowercase for the species. Italicize and abbreviate the Genus (e.g., _H. sapiens_) after the first full mention.

== Math
Mathematical notation requires consistent formatting. Use inline expressions for brief symbols (e.g., $E = m c^2$) and separate, centered blocks for complex equations:

$ f(arrow(x)) = -a exp(-b sqrt(1/n sum^n_(i = 1)(x^2_i))) - exp(1/n sum^n_(i = 1)(cos(c x_i))) $
