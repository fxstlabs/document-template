#let configure-index(body) = {
  // Disable link underlining in the index
  set underline(stroke: rgb(0, 0, 0, 0))
  
  body
}

#let render-index() = {
  show: configure-index.with()

  heading(outlined: false)[Index]

  context {
    let chapters = query(heading.where(outlined: true))

    for chapter in chapters {
      link(chapter.location())[#block(width: 100%)[
        #let page_num = counter(page).at(chapter.location()).first()
        
        #h(1em * (chapter.level - 1))
        #if chapter.numbering != none {
          let nums = counter(heading).at(chapter.location())
          numbering(chapter.numbering, ..nums)
        }
        #chapter.body
        #box(width: 1fr)[#repeat(".", gap: 0.3em)]
        #str(page_num)
      ]]
    }
  }
}
