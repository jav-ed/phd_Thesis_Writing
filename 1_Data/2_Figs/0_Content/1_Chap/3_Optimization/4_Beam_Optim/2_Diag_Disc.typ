/* -------------------------------------------------------------------------- */
#import "../../../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

 #let diag_comparison_beam_opti_2 = diagram(
        node-defocus: 0,
        spacing: (1cm, 2cm),
        edge-stroke: 1pt,
        crossing-thickness: 5,
        mark-scale: 100%,
        node-outset: 3pt,

        // ---------------------------- actual nodes ---------------------------- //
        new_node((0,0), [1D discretized force vector]),
        new_node((0, nd_vert_sp), [Transformation]),
        new_node((1,0), [#gls("fem")]),
        new_node((2, 1.25 * nd_vert_sp), [Comparison]),

        new_node((0,2.5*nd_vert_sp), [Continuous aerodynamics]),
        new_node((1,2.5*nd_vert_sp), [#gls("fem")]),

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

          quad((0,0), (0, nd_vert_sp), none, gray)  // Force vector to transformation
          quad((0, nd_vert_sp), (1,0), none, gray)  // Transformation to FEM
          quad((1,0), (2, 1.25 * nd_vert_sp), none, gray)  // FEM to comparison
          
          quad((0,2.5*nd_vert_sp), (1,2.5*nd_vert_sp), none, gray)  // Continuous aero to FEM
          quad((1,2.5*nd_vert_sp), (2, 1.25 * nd_vert_sp), none, gray)  // Lower FEM to comparison
        },
      )