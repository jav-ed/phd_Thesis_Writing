/* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.*/

// glossarium figure kind
#let __glossarium_figure = "glossarium_entry"
// prefix of label for retreiving of references
#let __glossary_label_prefix = "glossary:"
// global state constaining the glossary entry and their location
#let __glossary_entries = state("__glossary_entries", (:))

#let __query_labels_with_key(loc, key, before: false) = {
  if before {
    query(
      selector(label(__glossary_label_prefix + key)).before(loc, inclusive: false),
      loc,
    )
  } else {
    query(
      selector(label(__glossary_label_prefix + key)),
      loc,
    )
  }
}

/* ----------------------------------- gls ---------------------------------- */
#let gls(key, suffix: none, long: auto) = {
  locate(
    loc => {
      let __glossary_entries = __glossary_entries.final(loc);
      if key in __glossary_entries {
        let entry = __glossary_entries.at(key)

        let gloss = __query_labels_with_key(loc, key, before: true)

        let is_first = gloss == ();
        let entlong = entry.at("long", default: "")
        let textLink = if (is_first or long == true) and entlong != [] and entlong != "" {
          [ #entry.short#suffix (#emph(entlong))]
        } else {
          [#entry.short#suffix ]
        }

        [
        #link(label(entry.key))[#textLink]
        #label(__glossary_label_prefix + entry.key)
        ]
      } else {
        text(fill: red, "Glossary entry not found: " + key)
      }
    },
  )
}


/* -------------------------- gls first letter big -------------------------- */
#let gls_Upper_Jav(key, suffix: none, long: auto) = {
  locate(
    loc => {
      let __glossary_entries = __glossary_entries.final(loc);
      if key in __glossary_entries {

        let entry = __glossary_entries.at(key)
        
        let gloss = __query_labels_with_key(loc, key, before: true)

        let is_first = gloss == ();
        let entlong = entry.at("long", default: "")

        // if it is the first time this acronym is to be displayed show the long version
        let textLink = if (is_first or long == true) and entlong != [] and entlong != "" {
          [ #entry.short#suffix (#emph(entlong))]
        } 
        
        else {

          // display short version
          
          // true code -> type: content
          // [#entry.short#suffix ]

          // type(entry) --> dict
          // type(entry.short) --> string
          // type(key) --> string
          
          // extract current key
          let ct_Key = entry.short

          // get first letter of the key to be in capital letter
          let fist_Letter = ct_Key.at(0)
          let fist_Letter_Cap = upper(fist_Letter)

          // get remaining letter through slicing operation
          let remaining_Letters = ct_Key.slice(1)

          // concat the letters
          let updated_Key = fist_Letter_Cap + remaining_Letters

          // return as the default implementation does it, of type content with suffix added. Note the reason why the return  becomes of the type content is the argument: suffix = none. 
          // in case desired, one might could adjust this with an if statement to make it to an empty string in case of none.
          // However, for the moment it is not required
          [#updated_Key#suffix ]


          // return as string object
          // updated_Key + suffix


        }

        //  textLink is the visibile part
        [
        #link(label(entry.key))[#textLink]
        #label(__glossary_label_prefix + entry.key)
        ]
      } else {
        text(fill: red, "Glossary entry not found: " + key)
      }
    },
  )
}



/* -------------------------------------------------------------------------- */
// reference to term with pluralisation
#let glspl(key) = gls(key, suffix: "s")

// show rule to make the references for glossarium
#let make-glossary(body) = {
  show ref: r => {
    if r.element != none and r.element.func() == figure and r.element.kind == __glossarium_figure {
      // call to the general citing function
      gls(str(r.target), suffix: r.citation.supplement)
    } else {
      r
    }
  }
  body
}

#let print-glossary(entries, show-all: false) = {
  __glossary_entries.update(
    (x) => {
      for entry in entries {
        x.insert(
          entry.key,
          (
            key: entry.key,
            short: entry.short,
            long: entry.at("long", default: ""),
            desc: entry.at("desc", default: ""),
          ),
        )
      }

      x
    },
  )

  for entry in entries.sorted(key: (x) => x.key) {
    [
    #show figure.where(kind: __glossarium_figure): it => it.caption
    #par(
      hanging-indent: 1em,
      first-line-indent: 0em,
    )[
      #figure(
        supplement: "",
        kind: __glossarium_figure,
        numbering: none,
        caption: {
          locate(
            loc => {
              let term_references = __query_labels_with_key(loc, entry.key)
              if term_references.len() != 0 or show-all {
                let desc = entry.at("desc", default: "")
                let long = entry.at("long", default: "")
                let hasLong = long != "" and long != []
                let hasDesc = desc != "" and desc != []

                {
                  set text(weight: 600)
                  if hasLong [
                  #emph(entry.short) - #entry.long
                  ] else [
                  #emph(entry.short)
                  ]
                }
                if hasDesc [: #desc ] else [. ]

                term_references.map((x) => x.location())
                .sorted(key: (x) => x.page())
                .fold(
                  (values: (), pages: ()),
                  ((values, pages), x) => if pages.contains(x.page()) {
                    (values: values, pages: pages)
                  } else {
                    values.push(x)
                    pages.push(x.page())
                    (values: values, pages: pages)
                  },
                )
                .values
                .map(
                  (x) => link(
                    x,
                  )[#numbering(x.page-numbering(), ..counter(page).at(x))],
                )
                .join(", ")
              }
            },
          )
        },
      )[] #label(entry.key)
      ]
    #parbreak()
    ]
  }
};

