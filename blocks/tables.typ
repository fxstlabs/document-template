#import "@preview/zero:0.5.0": format-table

#let yaml-table(style: (:), ..dicts) = {
  let entries = ()
  for d in dicts.pos() {
    for (_, v) in d {
      entries.push(v)
    }
  }

  let props = ()
  for e in entries {
    for k in e.keys() {
      if k != "name" and k not in props {
        props.push(k)
      }
    }
  }

  let cells = ([],)
  for e in entries {
    cells.push(e.at("name", default: "Unknown"))
  }

  for prop in props {
    cells.push(prop)
    for e in entries {
      let val = e.at(prop, default: none)
      if val == none {
        cells.push(text(fill: gray)[no data])
      } else {
        cells.push(val)
      }
    }
  }

  table(
    columns: entries.len() + 1,
    ..style,
    ..cells
  )
}

#let comparison-table(tb) = {
  show std.table.cell.where(x: 0): strong
  set std.table(
    align: (x, y) => {
      if x == 0 {
        right
      } else {
        center
      }
    }
  )

  tb
}

#let numeric-table(is-numeric, tb) = {
  let horizontal-alignments = is-numeric.map(it =>
    if  it {
      right
    } else {
      left
    }
  )

  let decimal-alignments = is-numeric.map(it =>
    if it {
      auto
    } else {
      none
    }
  )

  set table(align: horizontal-alignments)
  show table: format-table(..decimal-alignments)
  tb
}

#let no-data() = text(gray)[No Data.]
