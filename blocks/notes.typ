#import "@preview/lucide:0.1.0": *

#let __note-any(icon-slug, title, color, content) = {
  block(
    breakable: false,
    stack(dir: ttb,
      block(
        width: 100%,
        inset: 0.5em,
        fill: color.lighten(70%),

        radius: (
          top-left: 0.25em,
          top-right: 0.25em,
        ),

        stack(
          dir: ltr,
          spacing: 0.5em,
          lucide-icon(icon-slug),
          align(left + horizon, strong(title))
        )
      ),
      block(
        width: 100%,
        inset: 0.75em,
        fill: color.lighten(90%),

        radius: (
          bottom-left: 0.25em,
          bottom-right: 0.25em,
        ),

        content
      )
    )
  )

}

#let note-informative(title, content) = {
  __note-any("book-text", title, blue, content)
}

#let note-hint(title, content) = {
  __note-any("book-marked", title, maroon, content)
}

#let note-preferred(title, content) = {
  __note-any("book-check", title, olive, content)
}

#let note-technical(title, content) = {
  __note-any("book-type", title, navy, content)
}

#let note-warning(title, content) = {
  __note-any("book-alert", title, yellow, content)
}

#let note-critical(title, content) = {
  __note-any("book-x", title, red, content)
}