#let __bibliography-location = "/resources/bibliography.yaml"
#let __bibliography-entries = yaml(__bibliography-location)

#let configure-bibliography(body) = {
  body
}

#let render-bibliography() = {
  show: configure-bibliography.with()

  if __bibliography-entries == none {
    return
  }

  bibliography(__bibliography-location, style: "ieee")
  pagebreak()
}