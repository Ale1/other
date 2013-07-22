EXAMPLE 1
  "12345678".split(/(...)/)

  this is the general structure of the delimiter result array when using groups (i.e regex enclosed in "()"):  
  (note this is conceptual only, the source code doesnt work exactly like this)

  [ scrap1, delimiter1, remainder1 ]

  1)  start reading your number from left to right.  
  2) the first three characters match regex, so its labled a delimiter and put into the result array.  anything to the right of it is put in the remainder.

  [scrap1,"123",45678]

  3) The scrap is everything to the left of the newly found delimiter that has already been evaluated and didnt match (in this case, its "" because there is nothing to the left of 123)

  ["","123",45678]

  4) start looking for matches again, but this time start from the remainder.  another match is found in first 3 digits of remainder:

  ["","123",(456)78]

  5) so another [scrap,delimiter,remainder] setup is inserted in the result array:

  ["","123",scrap2,delimiter2,remainder2]  

  6) filling it out gives:

  ["","123","","456",78].  the scrap is again "" because there is nothing to the left of the 456 in the remainder1

  7) we continue evaluating remainder2

  ["","123","","456","78"]  no matches in remainder2, so we leave it as is.    

  End result => "12345678".split(/(...)/) = ["","123","","456","78"] 


EXAMPLE 2
<<<<<<< HEAD
How about "123456".split(/(...)/)?

start=> 
[scrap1,"123",remainder1]
["","123","456"]
["","123",scrap2,(456),remainder2]  
["","123","","456",""]    # in this step remainder2 is "" as there is nothing to the right of last delimiter found
end=> ["","123","","456"]    # however, the #split method by default removes trailing empty strings before returning the result. this behaviour can de disabled with the optional second argument to the split method.


EXAMPLE 3
How about without the parenthesis?  not using parenthesis means the matches wont be saved in the result array.   
Lets try "12AB34QWR567".split(/\D+\d/), which checks for patterns of 1 or more letters following by a number.

start=>
[scrap1,delimter1,12(AB3)4QER567]   # fist match found
["12","AB3",4QER567]  #Im filling out the delimter1 here, and we.ll remove them at the end (though you can remove them as you go)
["12","AB3",4(QER5)67] #second delimter found
["12","AB3","4","QER5","67"]   #no more matches, final step is to delete delimeters from result array
end=> ["12","4","67"]

      
