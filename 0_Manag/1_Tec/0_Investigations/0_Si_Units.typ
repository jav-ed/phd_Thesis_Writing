// -------------------------- si units some details ------------------------- //
instead of using unify, use space and upright
$ 15 upright("m ")$ - make sure to have at least 2 characters when upright is used, otherwise use 
$ 15 space upright("m")$ - this version seems to be identical as the one above


there is a special dealing with ranges
$ 288.15 "K " space "to" space 233.15 "K " $ 

this vesion with upright(" to") comes close to the above one, however, it is not the same
use the following
$ 288.15 "K " upright(" to") space 233.15 "K " $ or


both versions are the same, either one free char space or use a space before. a space after the to has no impact
$ 288.15 "K " upright(" to") space 233.15 "K " $
$ 288.15 space upright("K") space "to" space 233.15 space upright("K") $

however the following mixture will not produce the very same output
$ 288.15 "K " space "to" space 233.15 "K " $

an arbitrary mix is not fine, thus try to use the first of the two fine versions:
$ 288.15 "K " upright(" to") space 233.15 "K " $


The following versions add to much of space
$ 288.15 "K " upright(" to") space 233.15 "K " $

Thus, this version is preferred
$ 288.15 "K " "to" 233.15 "K " $

In concrete, the space within "to" was removed and the space command afterwards. Sometimes this might look a bit too close. However, inshallah this can be used as the overall and general rule.
By the way the following should look very similar:

// see: https://github.com/typst/packages/tree/main/packages/preview/unify/0.4.3
#import "@preview/unify:0.6.0": num,qty,numrange,qtyrange, unit

$ 288.15 "K " "to" 233.15 "K " $

$ qtyrange("288.15", "233.15", "K", per: "/", delimiter: "\"to\"") $
