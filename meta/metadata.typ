#import "/meta/authors.typ": __author_names

#let __document = yaml("/resources/document.yaml")
#let __today = datetime.today()

#let configure-document-metadata(body) = {
  set document(
    title: __document.title,
    author: __author_names,
    date: __today,
    description: __document.description,
    keywords: __document.keywords

  )

  set text(font: "New Computer Modern")
  show raw: set text(font: "JetBrains Mono")
  set par(leading: 0.55em, spacing: 0.55em, first-line-indent: 1.8em, justify: false)
  show heading: set block(above: 1.4em, below: 1em)
  show link: underline

  
  body
}

#let render-document-metadata() = {
  
  // Document Identification Information

  table(
    stroke: rgb(0, 0, 0, 0),
    columns: (1fr, 1fr),
    table.header(strong[Key], strong[Value]),
    [Document Title], __document.title,
    [Document Collection], __document.collection,
    [Document ID], __document.id,
    [Document Version], __document.version,
    [Last Modified], __today.display("[day] [month repr:long] [year repr:full]")
  )

  // Document Keywords

  table(
    stroke: rgb(0, 0, 0, 0),
    columns: (1fr, 1fr),
    table.header(strong[Keywords], strong[]),
    __document.keywords.join(", "), [ ]
  )
  
}
