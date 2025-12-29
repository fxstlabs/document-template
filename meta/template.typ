#import "@preview/ccicons:1.0.1": *

#import "/meta/metadata.typ": *
#import "/meta/authors.typ": *
#import "/meta/bibliography.typ": *
#import "/meta/cover.typ": *
#import "/meta/style.typ": *
#import "/meta/index.typ": *

#let template(doc) = {

  ///////////////////////
  // Document Metadata //
  ///////////////////////

  show: configure-document-metadata.with()
  show: configure-global-style.with()

  //////////////// 
  // Title Page //
  ////////////////
  //////////////// 
  
  render-cover-page()

  pagebreak()

  //////////////////////////
  // Document Information //
  //////////////////////////

  heading(outlined:false)[About this Document]

  v(2em)

  render-document-metadata()
  
  v(2em)

  render-all-authors()
  
  align(bottom)[
    #text(size: 8pt, style: "italic")[
      This document is licensed under #link("https://creativecommons.org/licenses/by-nc-nd/4.0/", [CC-BY-NC-ND 4.0]).
    ]
  ]
  
  place(
    bottom + right,
    image("/resources/images/fxst-logo.svg", width: 3cm)
  )
  
  pagebreak()

  ////////////////////
  // Document Index //
  ////////////////////
  
  render-index()

  pagebreak()

  //////////////////
  // Main Content //
  //////////////////
  
  counter(page).update(1)

  set page(
    header: [
    ],
    numbering: "1 of 1"
  )

  set heading(numbering: "1.1.")

  doc
  
  pagebreak()

  //////////////////
  // Glossary //
  //////////////////

  render-glossary()

  //////////////////
  // Bibliography //
  //////////////////

  render-bibliography()

  /////////////////////
  // End of Document //
  /////////////////////

  set page(
    header: [
    ],
    numbering: none
  )

  align(center + horizon)[
    End of Document.
  ]
}
