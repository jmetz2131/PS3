###Problem Set 3
##Question 1
##Defining the class door
#The following code set which_door to be class "door".
#The sample (with replacement) represents the door the contestant choose
which_door <- structure(list(sample(1:3, 1, replace=T)), class="door")

#This verifies that the class of the object which_door is class door.
class(which_door)

##Question 2
#This is creating the method PlayGame for door objects
door.PlayGame <- function() UseMethod("PlayGame")

door.PlayGame = function(x){
  
}
