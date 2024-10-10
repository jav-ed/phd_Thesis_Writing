
/* -------------------------------------------------------------------------- */
#import "../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// in this file the glossary function is used
// here are some examples how the glossary function are used within the typst docs
// #gl_("key"), where the key is one of the keys defined below
// #gl_("swith"), would output SWITH
// for the plural verison #gl_("swith", pl:true) can be used --> would output SWITHs
// if desired, the full long version can be outputed as well:
// for the long verison #gl_("swith", long:true) 
// if desc fields are available below - they can be used to understand the meaning of the abbreviations or keys used

//see: https://github.com/typst/packages/tree/main/packages/preview/glossarium/0.4.1

// if you want to see wheter an update exists go to
// https://github.com/typst/packages/tree/main/packages/preview/glossarium

// create clear seperation between content and glossary
#pagebreak()

#set heading(numbering: none)


// adapt color
// #show link: set text(fill: green.darken(30%))

// only link color
// #show link: set text(fill: blue)
#show link: set text(fill: color_Link)

// color of key and description
// #set text(fill: color_Link)
// #set text(fill: gray.darken(70%))
= Glossary
#v(0.5em)
#print-glossary(

  (

    // ----------------------------- keys start ----------------------------- //
    (
      key: "swith",
      short: "SWITH",
      long: [
        #text(weight: "bold")[W]ing #text(weight: "bold")[S]tructure #text(weight: "bold")[I]ntegrated High-Pressure #text(weight: "bold")[H]ydrogen #text(weight: "bold")[T]anks],
      desc: [SWITH is pronounced "sweets." It is an aircraft design where hydrogen fuel storage tanks are incorporated directly into the wing structure. In order to increase the amount of gaseous hydrogen that can be carried, the pressure inside the hydrogen tanks is desired to be maximized. The structural integration between the wing and the tanks allows the wing and tanks to share loads like the aerodynamic and pressure loads.],
    ),
    (
      key: "lie",
      short: "LIE",

      // if long form is added, then it will appear as short (long) when the acronoym appears the first time
      long: [#text(weight: "bold")[L]oad #text(weight: "bold")[I]ntroduction #text(weight: "bold")[E]lement],
      desc: [A structural component designed to distribute or transfer forces from one part of a structure to another. In aerospace engineering, these elements could be used to surround the profile of a local section of the wing span. The physical surrounding object can then transfer loads to the local surrounded area, helping manage stresses and maintain structural integrity. Structural integrity refers to the ability of a structure or component to withstand its intended loads and forces without failing or experiencing excessive deformation. It encompasses the structure's capacity to maintain its shape, functionality, and performance under various operating conditions, effectively distribute stresses throughout its elements, and resist deformation, fatigue, and environmental degradation over time. Load introduction elements can take various forms depending on their specific function and location. They are also known as load transfer elements, load-bearing elements, force distribution components, or stress transfer devices. These components are essential in engineering design, particularly in complex structures where managing and distributing forces is critical for performance and safety.]
    ),
    (
      key: "fea",
      short: "FEA",
      long: [#text(weight: "bold")[F]inite #text(weight: "bold")[E]lement #text(weight: "bold")[A]nalysis],
      desc: [A numerical method used in engineering and mathematical physics to solve complex problems by dividing a large system into smaller, simpler parts called finite elements. In structural engineering and aerospace applications, FEA is widely used to analyze the behavior of materials and structures under various loads and conditions. It involves creating a mathematical model of an entire system as a network of discrete elements, then using software to simulate how the structure will react to real-world forces, vibration, heat, fluid flow, and other physical effects. FEA allows engineers to identify potential design weaknesses, optimize material usage, predict product performance, and solve intricate structural, thermal, and multiphysics problems. This method is particularly valuable in situations where analytical solutions are difficult or currently impossible to obtain, enabling an efficient and cost-effective design process, especially for complex geometries and multifaceted engineering challenges.],
    ),
    (
      key: "easa",
      short: "EASA",
      long: [#text(weight: "bold")[E]uropean Union #text(weight: "bold")[A]viation #text(weight: "bold")[S]afety #text(weight: "bold")[A]gency],
      desc: [The European Union Aviation Safety Agency (EASA) is an Agency of the European Union, governed by European law. Its main activities include, among others, developing and implementing safety standards and guidelines, certifying and regulating aircraft, engines, and aeronautical products, conducting safety assessments and inspections, and collaborating with other EU agencies and international organizations @Mensen2013[p.~417].]
    ),
    (
      key: "iso",
      short: "ISO",
      long: [
        #text(weight: "bold")[I]nternational
        #text(weight: "bold")[O]rganization for 
        #text(weight: "bold")[S]tandardization ],
    ),
    (
      key: "cs",
      short: "CS",
      long: [#text(weight: "bold")[C]ertificationan Union #text(weight: "bold")[S]pecification],
      desc: [The EASA construction regulations are referred to as the Certification Specification (CS) @Mensen2013[p.~109].]
    ),
    (
      key: "cgh2",
      short: [CGH#sub[2]],
      long: [#text(weight: "bold")[C]ompressed #text(weight: "bold")[G]aseous #text(weight: "bold")[H]ydrogen],
      desc: [hydrogen storage methods based on the ambient temperature compressed gaseous hydrogen (CGH 2)]
    ),
    (
      key: "ld",
      short: "LD",
      long: [#text(weight: "bold")[L]oad #text(weight: "bold")[D]iscretization],
      desc: "Eine kontinuierliche Kraftverteilung durch einzelne Punkt- und Flächenlasten annähern bzw. approximieren.",
    ),

    (
      key: "cfrp",
      short: "CFRP",
      long: [#text(weight: "bold")[C]arbon-#text(weight: "bold")[F]iber-#text(weight: "bold")[R]einforced-#text(weight: "bold")[P]olymers],
    ),
    (
      key: "cpu",
      short: "CPU",
      long: [#text(weight: "bold")[C]entral #text(weight: "bold")[P]rocessing #text(weight: "bold")[U]nit],
    ),
    (
      key: "gpu",
      short: "GPU",
      long: [#text(weight: "bold")[G]raphics #text(weight: "bold")[P]rocessing #text(weight: "bold")[U]nit],
      ),
    (
      key: "llm",
      short: "LLM",
      long: [#text(weight: "bold")[L]arge #text(weight: "bold")[L]anguage #text(weight: "bold")[M]odel],
      desc: "Natural language model used for a variety of fields. One the most famous large language model might be OpenAI's ChatGPT",
    ),
    (
      key: "github",
      short: "Github",
      long: "Github",
      desc: [#link("https://github.com/")[GitHub] is a web-based platform used by developers to host, manage, and collaborate on projects. It primarily focuses on version control and source code management using Git. While it's most commonly used for software development, GitHub also supports various other types of projects, including academic work like PhD theses. The platform hosts a vast number of open-source projects and facilitates collaboration among developers worldwide through features such as pull requests, issue tracking, and code reviews.],
    ),
    (
      key: "cfd",
      short: "CFD",
      long: "Computaitonal Fluid Dynamics",
      desc: "Eine numerische Methode um wichitge Kenngrößen einer Strömung herauszufinden. Die Methode kann angewandt werden um beispielsweise die Auftriebsverteilung oder Widerstand eines FLugobjektes zu erhalten.",
    ),

    // ------------------------------ keys end ------------------------------ //
   
  ),
  // show all term even if they are not referenced, default to true
  show-all: true
)