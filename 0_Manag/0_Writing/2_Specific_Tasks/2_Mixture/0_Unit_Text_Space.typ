when you write a text and it then contains numbers with a unit. you want the number and the unit that follows to be on the same line. you can inforce that for example through the usage of the the math mode in typst. However, then you have the issue that the numbers are written bigger than the reminaing text. do you understand my thinking, is it wrong? do you have a solution?


example:

33 m/s and in math mode $33 "m/s"$ "33 m/s"


#lorem(14) ab 15 m/s

solution:

#lorem(14) ab #box[15 m/s]

https://github.com/typst/typst/discussions/4372