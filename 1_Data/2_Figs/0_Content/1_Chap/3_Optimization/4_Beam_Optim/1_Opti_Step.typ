/* -------------------------------------------------------------------------- */
#import "../../../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

#import "2_Diag_Disc.typ":*

 #let diag_opti_step = diagram(
      node-defocus: 0,
      spacing: (1cm, 2cm),
      edge-stroke: 1pt,
      crossing-thickness: 5,
      mark-scale: 100%,  // arrow size
      // node-fill: luma(97%),
      node-outset: 3pt, // dist between arrow and node

      // ---------------------------- actual nodes ---------------------------- //
      new_node((0,0), [3D panel method (APAME @Filkovic) ] ),
      new_node((0,nd_vert_sp), [3D load to analytical 1D distributed load]),
      new_node((1,nd_vert_sp), [Beam modeler @interdetbeam_tool]),
      new_node((1,2*nd_vert_sp), [$Q_"true", M_"true"$]),

      new_node((0,3*nd_vert_sp), [Optimizer],),
      new_node((0,4*nd_vert_sp), [Beam modeler @interdetbeam_tool],),
      new_node((1,4*nd_vert_sp), [$Q_"optim", M_"optim"$ ]),

      // -------------------------- connection lines -------------------------- //
      {
        let quad(a, b, label, paint, ..args) = {
          paint = paint.darken(25%)

          if label != none {
            edge(a, b, text(paint, label), "-|>", 
            stroke: paint, label-side: center, ..args)
          }
          else{
            edge(a, b, "-|>", 
            stroke: paint, label-side: center, ..args)
          }
        }

        quad((0,0), (0,nd_vert_sp), none, gray)
        quad((0,nd_vert_sp), (1,nd_vert_sp), none, gray)
        quad((1,nd_vert_sp), (1,2*nd_vert_sp), none, gray)
        
        
        quad((0,3*nd_vert_sp), (0,4*nd_vert_sp), none, gray)
        // edge((0,3*nd_vert_sp), (0,4*nd_vert_sp), "->", bend:40deg)
        // edge((0,4*nd_vert_sp),(0,3*nd_vert_sp), "->", bend:40deg)
        // quad((0,3*nd_vert_sp), (1,4*nd_vert_sp), none, gray)

        quad((0,4*nd_vert_sp), (1,4*nd_vert_sp), none, gray)
        edge((1,2*nd_vert_sp),(1,4*nd_vert_sp), "<->", [$Delta Q, Delta M $] )

      },
    )