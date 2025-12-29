#let configure-cover-page(body) = {
  set page(
    margin: 4em
  )
  body
}

#let render-cover-page() = {
  show: configure-cover-page.with()

  v(4em)
  title()
  line(length: 75%)

  place(
    bottom + right,
    dx: 4em + 15cm,
    dy: 4em + 15cm,
    box(
      width: 100cm,
      height: 100cm,
      clip: true,
      image("/resources/images/fxst-logo.svg", width: 30cm),
    )
  )
}