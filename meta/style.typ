#import "@preview/zero:0.5.0": ztable, num, align-column, format-table
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#import "/meta/glossary.typ": *

#let configure-global-style(body) = {

  ////////////
  // Colors //
  ////////////

  let white-alt = gray.lighten(90%)

  /////////////////////////
  // Text and Paragraphs //
  /////////////////////////

  set text(font: ("New Computer Modern", "lucide"))
  
  set par(
    leading: 0.75em,
    spacing: 1.5em,
    justify: false
  )

  show heading: set block(above: 2em, below: 1em)

  show raw: set text(font: "JetBrains Mono")

  show link: underline

  set list(
    spacing: 1.5em,
  )

  ////////////////////
  // Styling Tables //
  //////////////////// 

  let table-header-bg-color = gray.lighten(80%)
  let table-stripe-fg-color = gray.lighten(50%)

  show table.cell.where(y: 0): strong

  set table(
    inset: 10pt,
    align: left,
    
    stroke: (x, y) => if y == 0 {
      (bottom: 0.5pt + black)
    },

    fill: (x, y) => if calc.even(y) and y != 0{ white-alt },
  )

  // Styling Figures //
  /////////////////////

  show figure.where(
    kind: raw
  ): set figure(supplement: "Raw Text Block")

  show figure.where(
    kind: "code"
  ): set figure(supplement: "Code Block")

  ////////////////////////////
  // Library Initialization //
  ////////////////////////////
  
  // Codly
  show: codly-init.with()
  codly(languages: codly-languages, zebra-fill: gray.lighten(90%))

  // Glossy
  show: configure-glossary.with()

  body
}
