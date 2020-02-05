#Part 1
a = 3
a
b=4
b
# Question 1
library(abind)
abind(a,b)

#Question 2
v1 <- c("1", "2", "3")
v1
length(v1)
v2 <- c("4", "5", "6")
v2
length(v2)

#Question 3
v1 <- c("John", "James", "Smith")
v1
v2 <- c("Sara","Jane", "Brown") 
v2

#Question 4
help(abind)

#Question 5
abind(v1, v2)

#Question 6
v3 <- abind(v1, v2)
v3
matrix(v3, nrow = 2, ncol = 3, byrow = TRUE)

#Question 7
m = matrix(v3, nrow = 2, ncol = 3, byrow = TRUE, 
       dimnames = list(NULL, c("First", "Middle", "Last")))
m

#Question 8
firstName <- m[, 1]
firstName
middleName <- m[, 2]
middleName
lastName <- m[, 3]
lastName

#Question 9
nameRan = c(sample(firstName,1), sample(middleName,1), sample(lastName,1))
nameRan

#Question 10
random_Name <- function(v1, v2){
  v3=abind(v1,v2)
  m = matrix(v3, nrow = 2, ncol = 3, byrow = TRUE, 
             dimnames = list(NULL, c("First", "Middle", "Last")))
  firstName <- m[, 1]
  middleName <- m[, 2]
  lastName <- m[, 3]
  nameRan = c(sample(firstName,1), sample(middleName,1), sample(lastName,1))
  return (nameRan)}

a = c("Harry", "James", "Potter")
b = c("Daine", "Sarah", "Weinryn")
random_Name(a,b)


#Part 2
trip1 <- c(150, 5, 1.50)
trip2 <- c(200, 7, 2.00)
trip3 <- c(300, 10, 2.25)
trip1
trip2
trip3

trips <- abind(trip1, trip2, trip3)
trips

travel = matrix(trips, nrow = 3, ncol = 3, byrow = TRUE,
       dimnames = list(c("Trip 1", "Trip 2", "Trip 3"),
                       c("Miles Driven", "Gal Gas", "Gas Cost")))
travel

#Question 1 - Cost per trip
#Gallons of gas * cost per gal
#t1 = travel[c()]
trip1Cost <- (trip1[2])*(trip1[3])
trip1Cost

trip2Cost <-(trip2[2])*(trip2[3])
trip2Cost

trip3Cost <- (trip3[2])*(trip3[3])
trip3Cost

#Question 2 - total distance for the three trips
d = travel[,c(1)]
d

distance = (travel[1,1])+(travel[2,1])+(travel[3,1])
distance

#Question 3 - Average Distance of the trips
avgDist = distance/3
avgDist

#Question 4 - Average cost/gal of gas total
avgCost = (travel[1,3]+travel[2,3]+travel[3,3])/3
avgCost

#Question 5 - Cost/mile total
avgCostMile = (trip1Cost+trip2Cost+trip3Cost)/distance
avgCostMile

#avgDist = colMeans(travel) gives average of entire matrix

#Question 6 - Convert miles to km (1 mile = 1.67 km)
convert <- d*1.67
convert

#Last bit - make a 7-trip matrix like above but include a column for travel type
#(highway, city, or mixed). Make a f(x) to determine best fuel economy?

allTrips<- c("150", "5","1.50", "highway", "200", "7", "2.00", "mixed", "300", "10", "2.25", "highway", "50", "2", "2.34", "city",
          "20", "1", "2.43", "city", "125", "4.25", "2.23", "highway","60", "1.75","3.00", "mixed" )
allTrips
moreTravel = matrix(allTrips, nrow = 7, ncol = 4, byrow = TRUE,
                dimnames = list(c("Trip 1", "Trip 2", "Trip 3", "Trip 4", "Trip 5", "Trip 6", "Trip 7"),
                                c("Miles Driven", "Gal Gas", "Gas Cost", "Type")))
moreTravel
travelFactor<- factor(moreTravel[,4],ordered = TRUE, 
                      levels = c("city", "mixed", "highway"))
travelFactor

bestTrip<- function(){
  allTrips<- c("150", "5","1.50", "highway", "200", "7", "2.00", "mixed", "300", "10", "2.25", "highway", "50", "2", "2.34", "city",
               "20", "1", "2.43", "city", "125", "4.25", "2.23", "highway","60", "1.75","3.00", "mixed" )
  moreTravel = matrix(allTrips, nrow = 7, ncol = 4, byrow = TRUE,
                      dimnames = list(c("Trip 1", "Trip 2", "Trip 3", "Trip 4", "Trip 5", "Trip 6", "Trip 7"),
                                      c("Miles Driven", "Gal Gas", "Gas Cost", "Type")))
  travelFactor<- factor(moreTravel[,4],ordered = TRUE, 
                        levels = c("city", "mixed", "highway"))
  shortTrip<- min(moreTravel[,1])
  shortTrip
  cheapGas<- min(moreTravel[,3])
  cheapGas
  print(shortTrip)
  print(cheapGas)
}
bestTrip()

#I want to find both the minimum distance traveled and the minimum fuel cost
#then compare them