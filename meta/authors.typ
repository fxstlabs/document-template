#import "@preview/sicons:16.0.0": *
#import "@preview/scienceicons:0.1.0": *

#let __authors = yaml("/resources/authors.yaml")
#let __author_names = __authors.values().map(it => if it.name == none { "Anonymous" } else { it.name })

  #show ref: it => {
    let el = it.element
    if el != none and el.func() == figure and el.kind == "author" {
      link(it.target, el.body)
    } else {
      it
    }
  }

#let render-author-contacts(author) = {
  let author-keys = author.keys()
  let icons = ()

  if author-keys.contains("email") {
    icons.push(link(author.email)[#email-icon()])
  }

  if author-keys.contains("website") {
    icons.push(link(author.website)[#website-icon()])
  }

  if author-keys.contains("links") {
    for (key, val) in author.links {
      icons.push(link(val)[#sicon(slug: key)])
    }
  }

  if icons.len() > 0 {
    stack(dir: ltr, spacing: 0.5em, ..icons)
  } else {
    text(fill: gray)[No contacts provided]
  }
}

#let render-all-authors() = {
  table(
    stroke: none,
    columns: (1fr, 1fr),
    align: horizon,
    inset: (y: 0.75em),
    table.header([*Author*], [*Contacts (Links)*]),
    ..__authors.pairs().map(it => {
      let (id, author-data) = it
      
      let name-cell = [
        #stack(
          dir: ltr,
          spacing: 0.5em,
          [
            #author-data.at("name", default: "Anonymous")
          ],
          [
            #figure(
              "",
              kind: "author",
              supplement: author-data.name,
              numbering: (.., last) => [],
            ) #label(id)
          ]
        )

        #text(gray, size: 0.9em)[#author-data.at("alias", default: "")]
          
      ]
      
      let contact-cell = render-author-contacts(author-data)
      (name-cell, contact-cell)
    }).flatten(),
  )
}