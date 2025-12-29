#import "@preview/glossy:0.9.0": *

#let __glossary-location = "/resources/glossary.yaml"
#let __glossary-entries = yaml(__glossary-location)

#let theme-simple-table = (
  section: (title, body) => {
    set heading(numbering: none)
    heading(level: 1, outlined: true, title)
    body
  },
  group: (name, index, total, body) => {

    if name != "" and total > 1 {
      heading(level: 2, outlined: false, name)
    }

    table(
      columns: (5fr, 1fr),
      table.header([*Term*], [*Pages*]),
      ..body,
    )
  },
  entry: (entry, index, total) => {
    let raw-entry = __glossary-entries.values().at(index)
    let refs = ()
    if raw-entry.keys().contains("references") {
      for bref in raw-entry.references {
        refs.push(ref(label(bref)))
      }
    }

    (
      entry.short + entry.label + " --- " + entry.long
      + if refs.len() > 0 { " " + refs.sum() } else { [] }
      + linebreak()
      + text(gray)[#entry.description],
      entry.pages.join(", ")
    )
  },
)


#let configure-glossary(body) = {
  let short-long-term(mode, short-form, long-form) = {
    if mode == "short" { short-form }
    else if mode == "long" { long-form }
    else {
      emph(long-form) + " (" + short-form + ")"
    }
}


  show: init-glossary.with(
    __glossary-entries,
    format-term: short-long-term
  )

  body
}

#let render-glossary() = {
  if __glossary-entries == none {
    return
  }

  set heading(numbering: none)

  glossary(
    theme: theme-simple-table,
    show-all: true
  )

  pagebreak()

}