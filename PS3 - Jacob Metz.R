###Problem Set 3
###Jacob Metz
##Question 1
##Defining the class door
#The following code set which_door to be class "door".
#The sample (with replacement) represents the door the contestant choose
which_door <- structure(list(sample(1:3, 1, replace=T)), class="door")


#This verifies that the class of the object which_door is class door.
class(which_door)

##Question 2/3
#This takes which_door and ensures that only a numeric is used in the door.PlayGame function. I verified that the output is only a number in the subsequent line.
guessed_door<-as.numeric(which_door)
guessed_door

#This is creating the method PlayGame for door objects
door.PlayGame <- function(x) UseMethod("PlayGame")

#The following function door.PlayGame takes in any value x.
#In the function itself, I created a variable called car_door which represents the door the car is behind.
#In order to randomly generate which door the car is behind, I used the sample() function to randomly output a number between 1 and 3
#For the next line, I used an ifelse statement which takes the which_door value
#and sees if it's equal to the car_door value. If it is, then it returns an Oprah-like
#note of congratulations. If not, it returns a note of sympathy that the contestant chose the door with the goat.
door.PlayGame = function(x){
  car_door <- sample(1:3, 1, replace=T)
  ifelse(which_door==car_door, "YES!!! Here are the keys to your brand new car! Congratulations!!!", "Oh no, it's a goat! Better luck next time, friend and thanks for playing!")
}
door.PlayGame(guessed_door)

##Question 4
#Doing the same thing through S4

#Here, I set up the class for this S4 system so that any object of class door
#must include a which_door number between 1 and 3 as specified below in the function.
setClass(Class="door",
   slots = list(which_door="numeric"),
   prototype = prototype(which_door = sample(1:3, 1, replace=T)),
   ) 

#The setValidity function here ensures that the object contains a which_door 
#number between 1 and 3. If the number is outside that range, the specified message
#will be returned to the user in the output.
setValidity("door", function(object){
  if((object@which_door %in% 1:3)!=TRUE) {
    return("Contestant, you can only choose a door between 1 and 3!")
  }
  return(TRUE)
})

#Here, I used the new() function, which according to the help files generates an object from a class.
#Using this function, I tried adding two new objects to check if my setClass and setValidity functions
#worked properly.
#The object test_guess is accepeted because the which_door numeric value is between 1 and 3
test_guess <- new("door", which_door=2)

#The object other_test_guess is not accepted because the which_door numeric value is outside 1 and 3
#leading to a return of the output message, "Contestant, you can only choose a door between 1 and 3!"
other_test_guess <- c("door", which_door=4)

#Here I am setting the generic function PlayGame
setGeneric("PlayGame",
    function(object="door"){
      standardGeneric("PlayGame")
    })

#Here, I am setting the specific method and accomplishing what I did earlier
#on the S3 type. The function will take an object with a specified which_door value
#that the contestant suggests. I used the exact same ifelse statement from above.
#If the which_door value equals the car_door value, then a note of congratulations will be returned.
#If the which_door value does not equal the car_door value, then a note of sympathy.
setMethod("PlayGame", "door",
    function(object){
      car_door <- sample(1:3, 1, replace=T)
      ifelse(which_door==car_door,"YES!!! Here are the keys to your brand new car! Congratulations!!!", "Oh no, it's a goat! Better luck next time, friend and thanks for playing!")
    })

#I tested out the setMethod here where the contestant chose door #2. 
#The function works as intended.
my_object <- new("door", which_door=2)
PlayGame(my_object)

