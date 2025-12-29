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
This is the official, general-purpose FXST document template. Documents developed by FXST should follow the guidelines outlined in this template in order to keep a consistent look accross all official works.

This Typst template includes several utilities such that the user requires minimal effort in order to comply with the style guidelines. Included in this template are:

- Predefined functions to wrap or generate document units.
- Automatic styling with `set` and `show` rules.
- Help from libraries such as _zero_ @typst-zero and _codly_ @typst-codly to achieve a consistent look.
- _YAML_ files to generate document metadata, the author list, the bibliography and a glossary.

Due to the fact that document styling is heavily automated, this document will only outline guidelines which cannot or should not be automated, as well as those which haven't been automated at the time of writing.

= Headings
In order for readers to have a clear understanding of the current document, all contents must be organized under appropriate headings according to the following guidelines:

/ Document Title: A concise and descriptive representation of the purpose of the document as a whole. Ideally, readers must be able to understand what the document is or is trying to communicate at a glance in order to assess whether or not it is worth their time.

/ Sections: Delimiters between topics. A single document may speak of a variety of topics in relation to a central idea or goal. Major shifts in subjects or topics should be assigned their own separate top-level sections, which MUST be accompanied by its own short and simple heading that provides a general introduction to the topic.

/ Subsections: Delimiters used to divide long or complex content into shorter, scannable logical units. Whenever a section becomes too visually cluttered, or too many sub-topics are being introduced, it is best to begin breaking down the contents of a section into subsections. We recommend considering breaking down *section content* into subsections in the event that one of these is true:

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
Text requires special attention to detail, as it constitutes most of the content in a document. Subtle differences in text formatting can create an important impact on the reader and must be treated carefully in maintain a harmonious flow of words. The following describes different forms of text formatting and their use cases:

/ Italicized Text: is used to highlight entities which may be of foreign origin to the reader and may require further context to understand. Examples include:

- The full name of a technical or specialized term that may require further definition.
  - A vet can determine how healthy a cat is through its @feline-bcs.
- Mentioning titles of foreign works. Please note that this does not ommit the need to provide a proper reference.
  - According to _Can Cats Eat Salami?_, "Cats can have a little salami" @cats-salami.
- Formatting scientific names. See @format-scientific-names
  - The scientific name of domestic house cats is _Felis catus_.

/ Boldface Text: should not be used for body text formatting.

/ Strikethrough Text: should not be used for body text formatting.

/ Underlined Text: should only be used to highlight links and anchors. See @format-external-links.

/ Raw Text: Used to display code as well as inputs or outputs of a computer process. See @format-code-blocks for more information.

= Layouts, Figures and Models
Organizing visuals and data efficiently allows the reader to find important information quickly. These elements can come in many shapes and sizes. The following guidelines describe how to format tables, graphs, images and other models.

== Tables
Tables arrange data logically in such a way that every datum has a given spot in relation to the concept(s) directly above and/or to the sides. All tables, by default, must have the following format:

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
        - Side headers are not mandatory and must only be used when the leftmost row contains a non-numeric, classifying label #footnote[A classifying label is a word or phrase that can be used to relate objects together. Examples include 'color', 'model', 'capacity', etc.].
      ],
      [*Cell Alignment*], [
        - Cell alignment depends on the type of table you are using. Consult @format-special-tables to find your particular use case.
        - If your use case is not contained within these instances, assume left alignment on all cells.
        - If you wish to create a new standard, contact #link("mailto:support@fxst.tech").
      ],
      [*Referentiability*], [
        - All tables must be wrapped in a `figure` block with an appropriate corresponding caption.
      ]
    )
  )
) <format-base-tables-rules>

=== Formatting Specialized Tables <format-special-tables>

Some tables use special formatting for enhanced readability. Their style guidelines are described in the following specification. Keep in mind that all rules from @format-base-tables-rules still apply.

/ Comparison Tables: Used to compare two or more items accross a particular set of characteristics.

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
  In order to quickly generate compliant formatting, wrap your existing table in the `comparison-table` wrapper, provided in `/blocks/tables.typ`. For an example, please see @example-comparison-table:
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

/ Numeric Data Tables: Used to represent numeric data effectively accross experiments, records, results and more.

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
  In order to quickly generate compliant formatting, wrap your existing table in the `numeric-table` wrapper, provided in `/blocks/tables.typ`. For an example, please see @example-numeric-table
]

#note-informative("Wrapper Arguments")[
  This wrapper *requires* a single argument: `is-numeric`, which an array of booleans. Each entry maps itself to its corresponding column (positionally). This allows the user to mark which columns are numeric and apply correct formatting automatically.
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

Figures refer to any visual element that is not a table. All figures must include a caption that describes what they represent and must be numbered sequentially. Examples of figures include, but are not limited to:

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
All list style guides have been automated.

== Raw Text Blocks <format-code-blocks>
Raw text blocks serve to display text with no applied formatting. These are useful for displaying code and process input/output. All raw text blocks are automatically styled by the _codly_ Typst package @typst-codly.

If a block of raw text is code, please use the figure supplement "Code Block". Otherwise, "Raw Text Block" will automatically be inserted for you.

#note-technical([About the "Code Block" supplement])[
  In order to automatically format raw text block supplements as "Code Block", you may set the `kind` of your `figure` to be `"code"`.
  
  We are looking for ways to do this automatically based on whether or not the `lang` key is either present or `none` (lmao we tried but it wouldn't budge).
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
Notes are blocks of information that stand out and are hard to miss. They feature colors and icons in order to make them pop. This tempplate provides 6 note templates using the `note-[note type]` functions which take two arguments: a title and a body. Users can define their own blocks using the `block-raw` function, all featured in `/blocks/notes.typ`.

#note-informative("This note is informative")[Information that is important but not exactly central. Use `note-informative`.]

#note-hint("This note is a hint")[To signal the reader towards a better alternative, a quality of life feature or convenience, etc. Use `note-hint`.]

#note-technical("This note is aimed at technical users")[You can use this one to discuss important details that an end-user can skip. Use `note-technical`.]

#note-preferred("This note is for good practices")[When documenting a product, this may be useful to guide users in the correct path. Use `note-preferred`.]

#note-warning("This note is a warning")[This note tells users to be cautious about what they're doing. Use `note-warning`.]

#note-critical("This note has critical information")[This note represents information that a user should not skip or else bad things could happen. Use `note-critical`. Do not abuse the use of this block to preserve its importance.]

== Glossary
This template uses the _glossy_ Typst package @typst-glossy to render a functional glossary. This template uses the package as a framework and introduces a simpler interface for the end user.

In order to create a glossary entry, edit the `/resources/glossary.yaml` file, which allows you to create your own glossary entries which will become automatically referentiable within the document. To reference a glossary entry, use the key you assigned in the YAML file. For more information, please see _glossy_'s #link("https://typst.app/universe/package/glossy", text(fill: blue)[documentation]).

== Footnotes
Since glossaries exist, footnotes should only be used to provide readers with context that may not be obvious at first glance. All definitions of foreign words must go in the glossary.

= Referencing Works
== Links <format-external-links>
All links should be underlined. All links to external content must also be written using blue text. This does not apply to references.

== Authors
Authors must me listed in the `/resources/authors.yaml` file. It supports keys for a name, alias, website, email and even some external links with icons. To see which entries are supported, please visit #link("https://simpleicons.org/", text(fill: blue)[Simple Icons]), then, use the provided _slug_ as your key in the YAML file. Review the template's author file to get an idea on how it works.

== Bibliography
All bibliography is styled in IEEE style. To add bibliographical entries, add your entry in `/resources/bibliography.yaml` in #link("https://github.com/typst/hayagriva", text(fill: blue, emph[Hayagriva])) format. You can reference your entry with the YAML key you provided. Once referenced, your entry will appear in the bibliography.

== Quotes
Quotes follow #link("https://sdu-kz.libguides.com/ieee/in-text", text(fill: blue)[IEEE style]).

= Formatting Special Terms and Tokens
== Scientific Names <format-scientific-names>
Scientific names use binomial nomenclature (Genus species), formatted by italicizing both parts, capitalizing only the Genus, and using lowercase for the species. Type in italics and abbreviate the Genus (e.g., H. sapiens) after the first full mention.

== Math
Writing math just involves using consistent formatting, with inline expressions for brief symbols (e.g., $E = m c^2$) and separate, centered, indented lines for complex equations such as:

$ f(vec(x)) = -a exp(-b sqrt(1/n sum^n_(i = 1)(x^2_i))) - exp(1/n sum^n_(i = 1)(cos(c x_i))) $
