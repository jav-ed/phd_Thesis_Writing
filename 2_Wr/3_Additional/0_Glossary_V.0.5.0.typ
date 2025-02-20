// in this file the glossary function is used
// here are some examples how the glossary function are used within the typst docs
// #gls("key"), where the key is one of the keys defined below
// #gls("swith"), would output SWITH
// for the plural verison #glspl("swith") can be used --> would output SWITHs
// if desired, the full long version can be outputed as well:
// for the long verison #gld("swith", long:true) 
// if desc fields are available below - they can be used to understand the meaning of the abbreviations or keys used

//see: https://github.com/typst/packages/tree/main/packages/preview/glossarium/0.5.0

// if you want to see wheter an update exists go to
// https://github.com/typst/packages/tree/main/packages/preview/glossarium

// proofread ins. done

// Inshallah completed
#let glos_entry_list = (
  (

    // ----------------------------- keys start ----------------------------- //
    (
      key: "swith",
      short: "SWITH",
      long: [
        #text(weight: "bold")[W]ing-#text(weight: "bold")[S]tructure
        -#text(weight: "bold")[I]ntegrated High-Pressure #text(weight: "bold")[H]ydrogen #text(weight: "bold")[T]anks],
      description: [SWITH is pronounced "sweets." It is an aircraft design where hydrogen fuel storage tanks are incorporated directly into the wing structure. In order to increase the amount of gaseous hydrogen that can be carried, the pressure inside the hydrogen tanks is aimed to be maximized. The structural integration between the wing and the tanks allows the wing and tanks to share loads like the aerodynamic and pressure loads.],
    ),
    (
      key: "lie",
      short: "LIE",

      // if long form is added, then it will appear as short (long) when the acronoym appears the first time
      long: [#text(weight: "bold")[L]oad-#text(weight: "bold")[I]ntroduction #text(weight: "bold")[E]lement],
      description: [A structural component designed to distribute or transfer forces from one part of a structure to another. In aerospace engineering, these elements could be used to surround the profile of a local section of the wing span. The physical surrounding object can then transfer loads to the local surrounded area, helping manage stresses and maintain structural integrity. 
      Structural integrity refers to the ability of a structure or component to withstand its intended loads and forces without failing or experiencing excessive deformation. 
      It encompasses the structure's capacity to maintain its shape, functionality, and performance under various operating conditions, effectively distribute stresses throughout its elements, and resist deformation, fatigue, and environmental degradation over time. 
      Load introduction elements can take various forms depending on their specific function and location. They are also known as load transfer elements, load-bearing elements, force distribution components, or stress transfer devices. These components are essential in engineering design, particularly in complex structures where managing and distributing forces is critical for performance and safety.]
    ),
    (
      key: "easa",
      short: "EASA",
      long: [#text(weight: "bold")[E]uropean Union #text(weight: "bold")[A]viation #text(weight: "bold")[S]afety #text(weight: "bold")[A]gency],
      description: [The European Union Aviation Safety Agency (EASA) is an Agency of the European Union, governed by European law. Its main activities include, among others, developing and implementing safety standards and guidelines, certifying and regulating aircraft, engines, and aeronautical products, conducting safety assessments and inspections, and collaborating with other EU agencies and international organizations @Mensen2013[p.~417].]
    ),
    (
      key: "iso",
      short: "ISO",
      long: [
        #text(weight: "bold")[I]nternational
        #text(weight: "bold")[O]rganization for 
        #text(weight: "bold")[S]tandardization ],
      description: [An independent, non-governmental international organization that develops and publishes international standards across various industries and sectors. These standards aim to ensure quality, safety, and efficiency of products. ISO standards are widely used in engineering and technical fields to, among other things, maintain consistency and interoperability across different countries and organizations. @iso_about_page]



    ),
    (
      key: "cs",
      short: "CS",
      long: [#text(weight: "bold")[C]ertification #text(weight: "bold")[S]pecification],
      description: [A set of technical standards and requirements published by EASA that aircraft, components, and systems must meet to be certified for use in civil aviation in the European Union. These specifications cover various aspects including design, manufacturing, and performance requirements @Mensen2013.]
    ),
    (
      key: "cgh2",
      short: [CGH#sub[2]],
      long: [#text(weight: "bold")[C]ompressed #text(weight: "bold")[G]aseous #text(weight: "bold")[H]ydrogen],
      description: [A form of hydrogen storage where hydrogen gas is kept in high-pressure tanks.]
    ),
    (
      key: "ld",
      short: "LD",
      long: [#text(weight: "bold")[L]oad #text(weight: "bold")[D]iscretization],
      description: [A numerical method that approximates continuous load 
    distributions through discrete point loads and surface loads.],
    ),

    (
      key: "cfrp",
      short: "CFRP",
      long: [#text(weight: "bold")[C]arbon-#text(weight: "bold")[F]iber-#text(weight: "bold")[R]einforced-#text(weight: "bold")[P]olymers],
      description: [A lightweight, high-strength composite material consisting of carbon fibers embedded in a polymer matrix. ]
    ),
    (
      key: "cpu",
      short: "CPU",
      long: [#text(weight: "bold")[C]entral #text(weight: "bold")[P]rocessing #text(weight: "bold")[U]nit],
      description: [The primary processor of a computer that performs most of the processing and coordinates other components. Designed for sequential processing and general-purpose computing tasks, handling the main instructions of computer programs.]
    ),
    (
      key: "gpu",
      short: "GPU",
      long: [#text(weight: "bold")[G]raphics #text(weight: "bold")[P]rocessing #text(weight: "bold")[U]nit],
      description: [A specialized processor designed for parallel processing of large data sets. Originally developed for rendering graphics, now also used for scientific computing, machine learning, and other tasks requiring massive parallel computations.]
      ),
    (
      key: "llm",
      short: "LLM",
      long: [#text(weight: "bold")[L]arge #text(weight: "bold")[L]anguage #text(weight: "bold")[M]odel],
      description: [An advanced artificial intelligence model trained on vast amounts of text data to understand and generate human-like text. These models use deep learning techniques to process language, enabling tasks like text generation, translation, and analysis. Notable examples include OpenAI's ChatGPT, Anthropic's Claude, Meta's Llama and Google's Gemini.]
    ),
    (
      key: "github",
      short: "GitHub",
      long: "GitHub",
      description: [#link("https://github.com/")[GitHub] is a web-based platform used by developers to host, manage, and collaborate on projects. It primarily focuses on version control and source code management using Git. While it's most commonly used for software development, GitHub also supports various other types of projects, including academic work like PhD theses. The platform hosts a vast number of open-source projects and facilitates collaboration among developers worldwide through features such as pull requests, issue tracking, and code reviews.],
    ),
    (
      key: "cfd",
      short: "CFD",
      long:  [#text(weight: "bold")[C]omputational #text(weight: "bold")[F]luid #text(weight: "bold")[D]ynamics],
      description:  [A numerical method that simulates fluid flow, heat transfer, and associated phenomena by solving partial differential equations. Widely used in mobility domains such as aerospace and automotive to predict aerodynamic forces, analyze flow patterns, and optimize designs.],
    ),
    (
      key: "fem",
      short: "FEM",
      long: "Finite Element Method",
      description:  [A numerical method used in engineering and mathematical physics to solve complex problems by dividing a large system into smaller, simpler parts called finite elements. In structural engineering and aerospace applications, FEM is widely used to analyze the behavior of materials and structures under various loads and conditions. It involves creating a mathematical model of an entire system as a network of discrete elements, then using software to simulate how the structure will react to real-world forces, vibration, heat, fluid flow, and other physical effects. FEM allows engineers to identify potential design weaknesses, optimize material usage, predict product performance, and solve intricate structural, thermal, and multiphysics problems. This method is particularly valuable in situations where analytical solutions are difficult or currently impossible to obtain, enabling an efficient and cost-effective design process, especially for complex geometries and multifaceted engineering challenges. @Mittelstedt2021 @Mittelstedt2022 @Werkle2021a @Hahn2018 @Langtangen2016 @Langtangen2019 @Dhondt2004],
    ),
    (
      key: "fd",
      short: "FD",
      long:  [#text(weight: "bold")[F]inite-#text(weight: "bold")[D]ifference],
      description: [A numerical method used to approximate derivatives and solve differential equations by replacing continuous derivatives with discrete approximations @Langtangen2017. It works by calculating the rate of change between points separated by a finite distance rather than using the limit definition of derivatives. Common types include forward difference, backward difference, and central difference schemes @Baerwolff2020 @Meister2019 @Munz2019 @Richter2017. Widely used in computational physics, engineering, and numerical analysis for solving partial differential equations.
      ],
    ),


    // ------------------------------ keys end ------------------------------ //
   
  )
)


