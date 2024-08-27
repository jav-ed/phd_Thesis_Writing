
/* -------------------------------------------------------------------------- */
#import "../../3_Code/1_Fcns/0_Fcn_Main.typ": *
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

    // ----------------------------- keys start ----------------------------- //
    (
      key: "fem",
      short: "FEM",

      // if long form is added, then it will appear as short (long) when the acronoym appears the first time
      long: "Finite Element Method",
      desc: "TBD",
    ),
    (
      key: "swith",
      short: "SWITH",
      long: [Wing-Structure-Integrated high-pressure Hydrogen Tanks],
      desc: "pronounced sweets",
    ),
    (
      key: "cfk",
      short: "CFK",
      long: "Kohlenstofffaserverstärkter Kunststoff",
      desc: " pronounced sweets",
    ),
    (
      key: "lee",
      short: "LEE",
      long: "Lasteinleitungselemente",
      desc: "TBD",
    ),
    (
      key: "fea",
      short: "FEA",
      long: "Finite-Elemente-Analyse",
      desc: "TBD",
    ),
    (
      key: "ld",
      short: "LD",
      long: "Lastdiskretisierung",
      desc: "Eine kontinuierliche Kraftverteilung durch einzelne Punkt- und Flächenlasten annähern bzw. approximieren.",
    ),
    (
      key: "cpu",
      short: "CPU",
      long: "Central Processing Unit",
      desc: "Computer-Prozessor",
    ),
    (
      key: "gpu",
      short: "GPU",
      long: "Graphics Processing Unit",
      desc: "Grafikprozessor",
    ),
    (
      key: "llm",
      short: "LLM",
      long: "Large Language Model",
      desc: "Natural language model used for a variety of fields. One the most famous large language model might be OpenAI's ChatGPT",
    ),
    (
      key: "github",
      short: "Github",
      long: "Github",
      desc: "https://github.com/",
    ),
    (
      key: "cfd",
      short: "CFD",
      long: "Computaitonal FLuid Dynamics",
      desc: "Eine numerische Methode um wichitge Kenngrößen einer Strömung herauszufinden. Die Methode kann angewandt werden um beispielsweise die Auftriebsverteilung oder Widerstand eines FLugobjektes zu erhalten.",
    ),

    // ------------------------------ keys end ------------------------------ //
   
  ),
  // show all term even if they are not referenced, default to true
  show-all: true
)