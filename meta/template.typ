#import "@preview/scienceicons:0.1.0": *

#import "/configuration.typ": config
#import "/meta/author.typ": render-author-info
#import "/meta/index.typ": index

#let template(doc) = {

  // Cover Page
  
  set document(
    title: config.title,
    author: config.authors.map(a => if a.name == none { "Anonymous" } else { a.name }),
    date: config.date,
    description: config.description,
    keywords: config.keywords
  )

  set page(
    margin: 4em,
    numbering: none
  )
  
  set par(justify: true)

  show title: set text(size: 36pt)
  show link: underline

  v(4em)
  title()
  line(length: 75%)
  config.collection

  place(
    bottom + right,
    dx: 4em + 15cm,
    dy: 4em + 15cm,
    box(
      width: 100cm,
      height: 100cm,
      clip: true,
      image(config.cover_image, width: 30cm),
    )
  )

  pagebreak()

  // Document metadata and details

  heading(outlined:false)[About this Document]

  v(2em)
  
  table(
    stroke: rgb(0, 0, 0, 0),
    columns: (1fr, 1fr),
    table.header(strong[Key], strong[Value]),
    [Last modified], [#config.date.display(config.date_display_format)],
    [Document ID], [#config.document-id],
    [Document Version], [#config.document-version],
    [Copyright], [#cc-icon() #cc-by-icon() #cc-nd-icon() (#link("https://creativecommons.org/licenses/by-nd/4.0/", [CC BY NC]))],
  )
  
  v(2em)
  
  render-author-info(config.authors)
  
  place(
    bottom + right,
    image(config.cover_image, width: 3cm)
  )
  
  pagebreak()

  // Document Index
  
  index()

  pagebreak()

  // Main content
  
  counter(page).update(1)

  set page(
    header: [
      #text(gray)[#config.title]
      #h(1fr)
      #text(gray)[#config.collection]
    ],
    numbering: "1 of 1"
  )

  set heading(numbering: "1.1.")

  doc
  
  set page(
    header: [],
    footer: [],
  )

  pagebreak()

  bibliography("/bibliography.yaml", style: "ieee")

  pagebreak()

  align(center + horizon)[
    End of Document.
  ]
}
