#let table_of_contents() = context {
  let chapter_selector = selector(
    heading.where(level: 1)
  )
  let chapters = query(chapter_selector)
  let numbers = range(1, chapters.len() + 1)
  [
    \
    #text(upper("Table of Contents"), style: "italic", size: 12pt) \
    \
    #table(
      columns: (auto, auto),
      align: (left, right + bottom),
      ..for (i, chapter) in numbers.zip(chapters) {
        let papers = range(2, 6)
        let chapter_text = if i in papers [
          \
          #text("Chapter " + str(i), style: "italic", size: 8pt) \
          #chapter.body
        ] else [
          #if i == 6 [
            \
          ]
          // Summary and bibliography are sort of separate from the discussion.
          #if i == 7 [
            \
            \
          ]
          #chapter.body
        ]
        let loc = chapter.location()
        let chapter_link = [#link(loc)[#loc.page()]]
        (chapter_text, chapter_link)
      }
    )

    \
  ]
}




