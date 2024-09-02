
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
      key: "swith",
      short: "SWITH",
      long: [
        #text(weight: "bold")[W]ing #text(weight: "bold")[S]tructure #text(weight: "bold")[I]ntegrated High-Pressure #text(weight: "bold")[H]ydrogen #text(weight: "bold")[T]anks],
      desc: "pronounced sweets",
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
      key: "ld",
      short: "LD",
      long: [#text(weight: "bold")[L]oad #text(weight: "bold")[D]iscretization],
      desc: "Eine kontinuierliche Kraftverteilung durch einzelne Punkt- und Flächenlasten annähern bzw. approximieren.",
    ),
    (
      key: "cpu",
      short: "CPU",
      long: [#text(weight: "bold")[C]entral #text(weight: "bold")[P]rocessing #text(weight: "bold")[U]nit],

      // TODO
      // add references
      desc: [The CPU is the primary component of a computer that performs most of the processing inside the computer. It executes computer program instructions and performs basic arithmetic, logical, control and input/output (I/O) operations specified by the instructions. The CPU is often referred to as the 'brain' of the computer. Modern CPUs are typically contain multiple processing cores, allowing for parallel processing of tasks. The performance of a CPU is generally determined by factors such as clock speed, number of cores, cache size, and instruction set architecture.],
    ),
    (
      key: "gpu",
      short: "GPU",
      long: [#text(weight: "bold")[G]raphics #text(weight: "bold")[P]rocessing #text(weight: "bold")[U]nit],
      desc: [GPU],
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