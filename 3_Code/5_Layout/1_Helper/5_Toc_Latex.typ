// Obtained thorugh: https://github.com/EpicEricEE/typst-plugins/blob/6b823f5212fe07bb09f71b5eb9cab02d528a5c2a/outex/src/outex.typ#L8-L27

// Permission to use this file was granted without any restrictions on the usage

// See conversation on discord (11.09.2024): https://discord.com/channels/1054443721975922748/1088372909111783525/threads/1283352970549002240

/* -------------------------------------------------------------------------- */


// Layout a heading entry in an outline.
//
// Parameters:
// - entry: The entry to apply the layout on.
// - gap: The gap between numbering and section title.
// - fill-pad: A dict (left, right) of the padding around the "fill" line.
// - bold: Whether to embolden first-level section titles.
// - space: Whether to add block-spacing before fist-level titles.
//
// Returns: The styled entry.
#let heading-entry(entry, gap, fill-pad, bold, space) = context {
  let el = entry.element
  let level = str(el.level)
  
  let number = if el.numbering != none {
    numbering(el.numbering, ..counter(heading).at(el.location()))
  }

  let page = {
    let page-numbering = el.location().page-numbering()

    // the page-numbering style "— I —" requires too much space in the toc. thus, we inshallah chose another numbering style that requires less space.
    // also, one could assume or pretend the alternative style, that is, "i" to be the same as the bigger "— I —" original vairaiton. 
    if page-numbering == "— I —"{
      page-numbering ="i"
    }

    // in case no roman letter are desired, get everything in regular arabic numerical digits
    // let page-numbering = "1"
    
    if page-numbering == none { page-numbering = "1" }
    numbering(page-numbering, ..counter(page).at(el.location()))
  }

  let number-width = measure(number + h(gap)).width
  let page-width = measure(page).width
  
  // Keep track of the maximum widths of the numbering and page.
  let state = state("outex:0.1.0/heading", (
    number-widths: (:),
    page-width: 0pt,
  ))

  state.update(state => {
    let number-widths = state.number-widths
    if level in number-widths {
      number-widths.at(level) = calc.max(number-widths.at(level), number-width)
    } else {
      number-widths.insert(level, number-width)
    }

    (
      page-width: calc.max(state.page-width, page-width),
      number-widths: number-widths
    )
  })


  // Add paragraph spacing
  if el.level == 1 and space { parbreak() }

  // Add links
  let linked = link.with(el.location())
  let number = linked(number)
  let title = linked(el.body)
  let page = linked(page)

  // Render with final state
  context {
    let state = state.final()
    let indent = range(1, el.level).map(level => {
      state.number-widths.at(str(level), default: 0pt)
    }).sum(default: 0pt)

    let number-width = if el.numbering == none { 0pt } else {
      state.number-widths.at(level)
    }

    let page-width = state.page-width
    let fill = if el.level > 1 { entry.fill }

    set text(size:1.1em, weight: "bold") if bold and el.level == 1

    box(grid(
      columns: (indent, number-width, 1fr, page-width),
      [],
      number,
      pad(
        right: fill-pad.right,
        title + box(width: 1fr, pad(left: fill-pad.left, fill))
      ),
      align(bottom + end, page)
    ))
  }
}

// Layout a figure entry in an outline.
//
// Parameters:
// - entry: The entry to apply the layout on.
// - gap: The gap between numbering and figure caption.
// - fill-pad: A dict (left, right) of the padding around the "fill" line.
//
// Returns: The styled entry.
#let figure-entry(entry, gap, fill-pad) = context {
  let el = entry.element
  
  let number = if el.numbering != none {
    numbering(el.numbering, ..el.counter.at(el.location()))
  }

  let page = {
    let page-numbering = el.location().page-numbering()
    if page-numbering == none { page-numbering = "1" }
    numbering(page-numbering, el.location().page())
  }

  let number-width = measure(number).width
  let page-width = measure(page).width
  
  // Keep track of the maximum widths of the numbering and page.
  let state = state("outex:0.1.0/figure/" + repr(el.kind), (
    number-width: 0pt,
    page-width: 0pt,
  ))

  state.update(state => {(
    page-width: calc.max(state.page-width, page-width),
    number-width: calc.max(state.number-width, number-width)
  )})

  // Add links
  let linked = link.with(el.location())
  let number = linked(number)
  let title = linked(el.caption.body)
  let page = linked(page)


  // Render with final state
  context {
    let state = state.final()
    let number-width = state.number-width
    let page-width = state.page-width

    box(grid(
      columns: (number-width, gap, 1fr, page-width),
      align(end, number),
      [],
      pad(
        right: fill-pad.right,
        title + box(width: 1fr, pad(left: fill-pad.left, entry.fill))
      ),
      align(bottom + end, page)
    ))
  }
}

// Template to apply for a LaTeX styled outline.
//
// Parameters:
// - gap: The gap between numbering and section title. (Default: 1em)
// - fill-pad: The padding around the "fill" line. (Default: (left: 0.5em, right: 1em))
// - bold: Whether to embolden first-level section titles. (Default: true)
// - space: Whether to add block-spacing before fist-level titles. (Default: true)
// - body: The content to apply the template on.
//
// Returns: The passed content with the styles applied.
#let outex(
  gap: 1em,
  fill-pad: (left: 0.5em, right: 1em),
  bold: true,
  space: true,
  body
) = {
  set outline(fill: align(end, repeat(gap: 0.5em, ".")))

  // Convert fill-pad to dict
  let fill-pad = if type(fill-pad) == dictionary {(
    left: fill-pad.at("left", default: 0pt),
    right: fill-pad.at("right", default: 0pt)
  )} else {(
    left: fill-pad,
    right: fill-pad
  )}
  
  show outline.entry: it => {
    let el = it.element
    if el.func() == heading {
      return heading-entry(it, gap, fill-pad, bold, space)
    } 

    // deactivated by javed
    // else if el.func() == figure {
    //   return figure-entry(it, gap, fill-pad)
    // }

    it
  }

  
  
  body
}
