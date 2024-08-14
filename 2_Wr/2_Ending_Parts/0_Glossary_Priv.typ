
/* -------------------------------------------------------------------------- */
#import "../../3_Code/0_Templ/1_Fcns.typ": *
/* -------------------------------------------------------------------------- */


// see: https://github.com/typst/packages/blob/main/packages/preview/glossarium/0.2.2/example/example.typ

// and: https://github.com/typst/packages/tree/main/packages/preview/glossarium/0.2.2

// create clear seperation between content and glossary
#pagebreak()

// adapt color
// #show link: set text(fill: green.darken(30%))

// only link color
// #show link: set text(fill: blue)
#show link: set text(fill: color_Link)

// color of key and description
// #set text(fill: color_Link)
// #set text(fill: gray.darken(70%))

#print-glossary(

  (
    (
      key: "bismillah",
      short: "bismillah",

      // if long form is added, then it will appear as short (long) when the acronoym appears the first time
      long: "",
      desc: "TBD",
    ),
    (
      key: "inshallah",
      short: "inshallah",
      long: "",
      desc: "TBD",
    ),
    (
      key: "allhamdulillah",
      short: "allhamdulillah",
      long: "",
      desc: "TBD",
    ),
    (
      key: "mashallah",
      short: "mashallah",
      long: "",
      desc: "TBD",
    ),
    (
      key: "fatima",
      short: "Fatima",
      long: "",
      desc: "Fatima die Tochter de geliebten Propheten saw.",
    ),
    (
      key: "saw",
      short: "Muhammad",
      long: "",
      desc: "Peace be upon you slave and rasul of Allah",
    ),
    (
      key: "quran",
      short: "Quran",
      long: "",
      desc: "The word of the allmighty Allah",
    ),
    (
      key: "ayat",
      short: "Ayat",
      long: "",
      desc: "Ayat in the quran but in general a sign that is crafted or send by Allah subhana wa ta ala to among others get people to think about and build a relationship with Allah. It might also might be seen as a miracle. For example think of the very thin layer of the atmosphere -> todays science tells us that it filter dangerous radition from the sunlight. There is a reason why people are afraid of this skin getting smaller ",
    ),
    (
      key: "hadith",
      short: "hadith",
      long: "",
      desc: "A saying, quite acceptance or a deed of the beloved prophet saw ",
    ),
    (
      key: "mosque",
      short: "mosque",
      long: "",
      desc: "The word mosque describes the place where muslim go to worship Allah the allmighty. The orginal word comes from the arabic and is masjid, which means, the place we muslims do sajda. Sajda is the act when the muslims go to the ground, their head touches the ground and they totally surrender in front of Allah the perfect One. So a mosque or a masjid is every place where a muslim fells to the ground before Allah the perfect One.",
    ),
   
  ),
  // show all term even if they are not referenced, default to true
  show-all: true
)