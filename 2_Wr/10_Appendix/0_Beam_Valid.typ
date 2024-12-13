/* -------------------------------------------------------------------------- */
#import "../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */


// Title was tested and is inshallah fine 
== Beam Solver Validation Examples <chap_Append_A_0> 

As elaborated in @chap_4_0_2, the computational implementation of beam models required thorough validation of the selected solver. This appendix presents some of the validation results for IndeterminateBeam @interdetbeam_tool against established textbook solutions. 
For the first validation case, @fig_Ap_0 shows the beam schematic along with the reaction forces, while @fig_Ap_1 presents the corresponding distributions of normal forces, shear force distribution, and bending moments. For all subsequent validation cases (@fig_Ap_3 through @fig_Ap_11), each figure combines the beam schematic, reaction forces, shear force distribution, and bending moment distributions. 
The normal force distributions are omitted in these cases as they are zero throughout the beam length. 
@fig_Ap_0 through @fig_Ap_6 demonstrate the validation for five statically determinate beam configurations, while @fig_Ap_7 through @fig_Ap_11 show the results for five statically indeterminate cases.


// -------------------- statically determined beam models ------------------- //


// ------------------------------ beam model 0 ------------------------------ //

#figure(
  image("../../1_Data/2_Figs/0_Content/3_Appendix/0_Beam_Verific/a0_0.svg", 
  width: 100%),
  caption: [Beam schematic with boundary conditions and corresponding reaction forces for the first statically determined model.],
  kind:"image_app",
  supplement: "Figure",
)<fig_Ap_0>

#figure(
  image("../../1_Data/2_Figs/0_Content/3_Appendix/0_Beam_Verific/a0_1.svg", 
  width: 100%),
  caption: [Normal force, shear force, and bending moment distributions for the first statically determined model of @fig_Ap_0.],
  kind:"image_app",
  supplement: "Figure",
)<fig_Ap_1>

#pagebreak()

// ------------------------------ beam model 1 ------------------------------ //
#figure(
  image("../../1_Data/2_Figs/0_Content/3_Appendix/0_Beam_Verific/a1_combined.svg", 
  width: 85%),
  caption: [Beam schematic with boundary conditions, corresponding reaction forces, shear force distribution, and bending moment distributions for the second statically determined model.],
  kind:"image_app",
  supplement: "Figure",
)<fig_Ap_3>


// ------------------------------ beam model 3 ------------------------------ //
#figure(
  image("../../1_Data/2_Figs/0_Content/3_Appendix/0_Beam_Verific/a3_combined.svg", 
  width: 85%),
  caption: [Beam schematic with boundary conditions, corresponding reaction forces, shear force distribution, and bending moment distributions for the third statically determined model.],
  kind:"image_app",
  supplement: "Figure",
)<fig_Ap_4>


// ------------------------------ beam model 4 ------------------------------ //
#figure(
  image("../../1_Data/2_Figs/0_Content/3_Appendix/0_Beam_Verific/a4_combined.svg", 
  width: 85%),
  caption: [Beam schematic with boundary conditions, corresponding reaction forces, shear force distribution, and bending moment distributions for the fourth statically determined model.],
  kind:"image_app",
  supplement: "Figure",
)<fig_Ap_5>


// ------------------------------ beam model 9 ------------------------------ //
#figure(
  image("../../1_Data/2_Figs/0_Content/3_Appendix/0_Beam_Verific/a9_combined.svg", 
  width: 85%),
  caption: [Beam schematic with boundary conditions, corresponding reaction forces, shear force distribution, and bending moment distributions for the fifth statically determined model.],
  kind:"image_app",
  supplement: "Figure",
)<fig_Ap_6>


// ========================================================================== //
// =============== statically indetermined beam model 10 to 15 ============== //
// ========================================================================== //
// ------------------------------ beam model 10 ------------------------------ //
#figure(
  image("../../1_Data/2_Figs/0_Content/3_Appendix/0_Beam_Verific/a10_combined.svg", 
  width: 85%),
  caption: [Beam schematic with boundary conditions, corresponding reaction forces, shear force distribution, and bending moment distributions for the first statically indeterminate model.],
  kind:"image_app",
  supplement: "Figure",
)<fig_Ap_7>


// ------------------------------ beam model 11 ------------------------------ //
#figure(
  image("../../1_Data/2_Figs/0_Content/3_Appendix/0_Beam_Verific/a11_combined.svg", 
  width: 85%),
  caption: [Beam schematic with boundary conditions, corresponding reaction forces, shear force distribution, and bending moment distributions for the second statically indeterminate model.],
  kind:"image_app",
  supplement: "Figure",
)<fig_Ap_8>


// ------------------------------ beam model 12 ------------------------------ //
#figure(
  image("../../1_Data/2_Figs/0_Content/3_Appendix/0_Beam_Verific/a12_combined.svg", 
  width: 85%),
  caption: [Beam schematic with boundary conditions, corresponding reaction forces, shear force distribution, and bending moment distributions for the third statically indeterminate model.],
  kind:"image_app",
  supplement: "Figure",
)<fig_Ap_9>


// ------------------------------ beam model 13 ------------------------------ //
#figure(
  image("../../1_Data/2_Figs/0_Content/3_Appendix/0_Beam_Verific/a13_combined.svg", 
  width: 85%),
  caption: [Beam schematic with boundary conditions, corresponding reaction forces, shear force distribution, and bending moment distributions for the fourth statically indeterminate model.],
  kind:"image_app",
  supplement: "Figure",
)<fig_Ap_10>



// ------------------------------ beam model 15 ------------------------------ //
#figure(
  image("../../1_Data/2_Figs/0_Content/3_Appendix/0_Beam_Verific/a15_combined.svg", 
  width: 85%),
  caption: [Beam schematic with boundary conditions, corresponding reaction forces, shear force distribution, and bending moment distributions for the fifth statically indeterminate model.],
  kind:"image_app",
  supplement: "Figure",
)<fig_Ap_11>