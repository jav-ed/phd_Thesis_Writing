// see: https://github.com/Jollywatt/typst-fletcher?tab=readme-ov-file
#import "@preview/fletcher:0.5.2" as fletcher: diagram, node, edge


#let new_node(pos, label, tint: white, ..args) = node(
  pos,
  align(center, label),
  stroke: 1pt + green.darken(20%), 
  corner-radius: 5pt,
	..args,
)

#let nd_vert_sp = 0.6

// example application:
// #figure(

//   diagram(
//     node-defocus: 0,
//     spacing: (1cm, 2cm),
//     edge-stroke: 1pt,
//     crossing-thickness: 5,
//     mark-scale: 100%,  // arrow size
//     // node-fill: luma(97%),
//     node-outset: 3pt, // dist between arrow and node

  
//     new_node((0,0), [3D-Panel Method (APAME @Filkovic) ] ),
//     new_node((0,1), [3D load to analytical 1D distributed load]),
//     new_node((1,1), [Beam-Modeler]),


//     {
//       let quad(a, b, label, paint, ..args) = {
//         paint = paint.darken(25%)

//         if label != none {
//           edge(a, b, text(paint, label), "-|>", 
//           stroke: paint, label-side: center, ..args)
//         }
//         else{
//           edge(a, b, "-|>", 
//           stroke: paint, label-side: center, ..args)
//         }
//       }

//       quad((0,0), (1,0), none, gray)

//     },
//   ),
//   caption:[Test]

//   )<fig_test>