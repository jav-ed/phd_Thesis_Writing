--------------------------------------------------------------------- //
#show heading: it => {

  // Actual heading display
  if it.level == 1 {
    [#it.numbering Chapter #it.body]
  } 
  
  else if it.level == 2 {
    [#it.numbering Section #it.body]
  } 
  
  else if it.level == 3 {
    [#it.numbering Subsection #it.body]
  } 
  
  else {
    [#it.numbering Sub-Subsection #it.body]
  }


// [#it.numbering #it.supplement #it.body ]
  // [#it.fields()]

  // // Debug information
  // let debug-info = "Heading Debug Info:\n"
  // debug-info += "Type: " + type(it) + "\n"
  // debug-info += "Level: " + str(it.level) + "\n"
  // debug-info += "Body: " + repr(it.body) + "\n"
  // debug-info += "Numbering: " + repr(it.numbering) + "\n"
  // debug-info += "it itself: " + repr(it) + "\n"
  // // debug-info += "Outlined: " + str(it.outlined) + "\n"
  
  // // Display debug info (comment out in final version)
  // [#debug-info]
 
}