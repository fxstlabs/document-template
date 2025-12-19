#import "@preview/scienceicons:0.1.0": *

#let contact-fields = (
  email: email-icon,
  website: website-icon,
  youtube: youtube-icon,
  github: github-icon,
  orcid: orcid-icon,
  linkedin: linkedin-icon,
  x: x-icon,
)

#let author(..fields) = fields.named()

#let render-contacts(author) = {
  let links = contact-fields.pairs()
    .filter(((field, _)) => field in author and author.at(field) != none)
    .map(((field, icon-fn)) => [#link(author.at(field), icon-fn())#h(0.25em)])
  
  if links.len() > 0 {
    links.join()
  } else {
    text(fill: gray)[No contacts provided]
  }
}

#let render-author-info(authors) = {
  table(
    stroke: rgb("#00000000"),
    columns: (1fr, 1fr),
    align: (left, left),
    table.header(strong[#if authors.len() > 1 [Authors] else [Author]], strong[Contact Information (Links)]),
    ..authors.map(author => (
      // Left: name
      if "name" in author and author.name != none {
        [
          #author.name
          #if "alias" in author and author.alias != none [
            #text(fill: gray)[(A.K.A. #author.alias)]
          ]
        ]
      } else {
        [Anonymous]
      },
      // Right: contacts
      render-contacts(author)
    )).flatten()
  )
}