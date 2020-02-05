#---------BUILDING A FUNCTION--------
deck <- c("Duke", "Assassin", "Captain", "Ambassador", "Contessa")
print(deck)

hand <- sample(deck, size = 3, replace = T)
print(hand)

draw <- function(){
  deck <- c("Duke", "Assassin", "Captain", "Ambassador", "Contessa")
  hand <- sample(deck, size = 3, replace = T)
  print(hand)
}

draw()
