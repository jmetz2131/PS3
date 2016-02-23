###Problem Set 3
##Question 1
##Defining the class door
#The following code set which_door to be class "door".
#The sample (with replacement) represents the door the contestant choose
which_door <- structure(list(sample(1:3, 1, replace=T)), class="door")


#This verifies that the class of the object which_door is class door.
class(which_door)

##Question 2
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
