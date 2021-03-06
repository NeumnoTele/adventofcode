input <- 347991

# one right, one up
# two left, two down
# thre right, thee up
# four left, four down
# ...

x <- 0 #horizontal
y <- 0 #vertical

i <- 1
n <- 1

smaller <- TRUE

distance <- 0

while (smaller) {
  if (i == input) { #if input 1
    smaller <- FALSE
    break
  }
  
  #right
  for (j in 1:n) {
    x <- x + 1
    i <- i + 1
    if (i == input) {
      smaller <- FALSE
      break #break for loop if come to the end
    }
  }
  if (!smaller) break #break while loop if coem to the end
  
  #up
  for (j in 1:n) {
    y <- y + 1
    i <- i + 1
    if (i == input) {
      smaller <- FALSE
      break
    }
  }
  if (!smaller) break
  
  n <- n + 1 #increase the step
  
  #left
  for (j in 1:n) {
    x <- x - 1
    i <- i + 1
    if (i == input) {
      smaller <- FALSE
      break
    }
  }
  if (!smaller) break
  
  #down
  for (j in 1:n) {
    y <- y - 1
    i <- i + 1
    if (i == input) {
      smaller <- FALSE
      break
    }
  }
  
  n <- n + 1 #increase the step (for new iteration)
}

dist <- abs(x) + abs(y) #manhattan distance

#part two (look analysis2017_03.txt for more info)
funcs <- list(NULL) #list of node:adjacent_nodes
values <- c(1) #calculated values of nodes

i <- 2
step <- 1

smaller2 <- TRUE

while (smaller2) {
  if (step == 1) { #for first step (representing: right one, up one)
    funcs[[i]] <- c(1)
    summa <- 0
    for (f in funcs[[i]]) {
      summa <- summa + values[f]
    }
    values <- c(values, summa)
    if (summa >= input) {
      smaller2 <- FALSE
      break
    }
    
    i <- i+1
    
    funcs[[i]] <- c(2, 1)
    summa <- 0
    for (f in funcs[[i]]) {
      summa <- summa + values[f]
    }
    values <- c(values, summa)
    if (summa >= input) {
      smaller2 <- FALSE
      break
    }
    
    i <- i+1
    step <- step + 1
    
  } else if (step == 2) { #for second step (representing: left two down two)
    funcs[[i]] <- c(3, 2, 1)
    summa <- 0
    for (f in funcs[[i]]) {
      summa <- summa + values[f]
    }
    values <- c(values, summa)
    if (summa >= input) {
      smaller2 <- FALSE
      break
    }
    
    i <- i+1
    
    funcs[[i]] <- c(4, 1)
    summa <- 0
    for (f in funcs[[i]]) {
      summa <- summa + values[f]
    }
    values <- c(values, summa)
    if (summa >= input) {
      smaller2 <- FALSE
      break
    }
    
    i <- i+1
    
    funcs[[i]] <- c(5, 4, 1)
    summa <- 0
    for (f in funcs[[i]]) {
      summa <- summa + values[f]
    }
    values <- c(values, summa)
    if (summa >= input) {
      smaller2 <- FALSE
      break
    }
    
    i <- i+1
    
    funcs[[i]] <- c(6, 1)
    summa <- 0
    for (f in funcs[[i]]) {
      summa <- summa + values[f]
    }
    values <- c(values, summa)
    if (summa >= input) {
      smaller2 <- FALSE
      break
    }
    
    i <- i+1
    step <- step + 1
    
  } else if (step == 3) { #for third step (representing: right three, up three)
    funcs[[i]] <- c(7, 6, 2, 1)
    summa <- 0
    for (f in funcs[[i]]) {
      summa <- summa + values[f]
    }
    values <- c(values, summa)
    if (summa >= input) {
      smaller2 <- FALSE
      break
    }
    
    i <- i+1
    
    funcs[[i]] <- c(8, 2, 1)
    summa <- 0
    for (f in funcs[[i]]) {
      summa <- summa + values[f]
    }
    values <- c(values, summa)
    if (summa >= input) {
      smaller2 <- FALSE
      break
    }
    
    i <- i+1
    
    funcs[[i]] <- c(9, 2)
    summa <- 0
    for (f in funcs[[i]]) {
      summa <- summa + values[f]
    }
    values <- c(values, summa)
    if (summa >= input) {
      smaller2 <- FALSE
      break
    }
    
    i <- i+1
    
    funcs[[i]] <- c(10, 9, 3, 2)
    summa <- 0
    for (f in funcs[[i]]) {
      summa <- summa + values[f]
    }
    values <- c(values, summa)
    if (summa >= input) {
      smaller2 <- FALSE
      break
    }
    
    i <- i+1
    
    funcs[[i]] <- c(11, 3, 2)
    summa <- 0
    for (f in funcs[[i]]) {
      summa <- summa + values[f]
    }
    values <- c(values, summa)
    if (summa >= input) {
      smaller2 <- FALSE
      break
    }
    
    i <- i+1
    
    funcs[[i]] <- c(12, 3)
    summa <- 0
    for (f in funcs[[i]]) {
      summa <- summa + values[f]
    }
    values <- c(values, summa)
    if (summa >= input) {
      smaller2 <- FALSE
      break
    }
    
    i <- i+1
    step <- step + 1
    
  } else if (step < 5) { #for fourth step (representing: left four OR down four)
    #first 3 steps are fully hard coded
    #here we start the algorithm (expanded in next step)
    
    #first
    funcs[[i]] <- c(i-1, funcs[[i-1]][1], funcs[[i-1]][2]+1, funcs[[i-1]][2])
    summa <- 0
    for (f in funcs[[i]]) {
      summa <- summa + values[f]
    }
    values <- c(values, summa)
    if (summa >= input) {
      smaller2 <- FALSE
      break
    }
    
    i <- i+1
    
    #second
    funcs[[i]] <- c(i-1, funcs[[i-2]][2]+2, funcs[[i-2]][2]+1, funcs[[i-2]][2])
    summa <- 0
    for (f in funcs[[i]]) {
      summa <- summa + values[f]
    }
    values <- c(values, summa)
    if (summa >= input) {
      smaller2 <- FALSE
      break
    }
    
    i <- i+1
    
    #third
    funcs[[i]] <- c(i-1, funcs[[i-1]][2], funcs[[i-1]][3])
    summa <- 0
    for (f in funcs[[i]]) {
      summa <- summa + values[f]
    }
    values <- c(values, summa)
    if (summa >= input) {
      smaller2 <- FALSE
      break
    }
    
    i <- i+1
    
    #fourth
    funcs[[i]] <- c(i-1, funcs[[i-1]][2])
    summa <- 0
    for (f in funcs[[i]]) {
      summa <- summa + values[f]
    }
    values <- c(values, summa)
    if (summa >= input) {
      smaller2 <- FALSE
      break
    }
    
    i <- i+1
    
    step <- step + 0.5 #we go over twice (same as before, but it was hardcoded, here we can use for loop)
    
  } else {
    #expanded algorithm for any step bigger
    
    #first
    funcs[[i]] <- c(i-1, funcs[[i-1]][1], funcs[[i-1]][2]+1, funcs[[i-1]][2])
    summa <- 0
    for (f in funcs[[i]]) {
      summa <- summa + values[f]
    }
    values <- c(values, summa)
    if (summa >= input) {
      smaller2 <- FALSE
      break
    }
    
    i <- i+1
    
    #second
    funcs[[i]] <- c(i-1, funcs[[i-2]][2]+2, funcs[[i-2]][2]+1, funcs[[i-2]][2])
    summa <- 0
    for (f in funcs[[i]]) {
      summa <- summa + values[f]
    }
    values <- c(values, summa)
    if (summa >= input) {
      smaller2 <- FALSE
      break
    }
    
    i <- i+1
    
    #between
    for (b in 1:(floor(step)-4)) {
      funcs[[i]] <- (funcs[[i-1]])+1
      summa <- 0
      for (f in funcs[[i]]) {
        summa <- summa + values[f]
      }
      values <- c(values, summa)
      if (summa >= input) {
        smaller2 <- FALSE
        break #break for
      }
      
      if (!smaller2) break #break for
      
      i <- i+1
    }
    if (!smaller2) break #break while
    
    
    #second to last
    funcs[[i]] <- c(i-1, funcs[[i-1]][2], funcs[[i-1]][3])
    summa <- 0
    for (f in funcs[[i]]) {
      summa <- summa + values[f]
    }
    values <- c(values, summa)
    if (summa >= input) {
      smaller2 <- FALSE
      break
    }
    
    i <- i+1
    
    #last
    funcs[[i]] <- c(i-1, funcs[[i-1]][2])
    summa <- 0
    for (f in funcs[[i]]) {
      summa <- summa + values[f]
    }
    values <- c(values, summa)
    if (summa >= input) {
      smaller2 <- FALSE
      break
    }
    
    i <- i+1
    
    step <- step + 0.5
  }
}

first_smalles <- tail(values, n=1)


dist

first_smalles

#this code is a shitshow, but it works and is quite algorithmically correct and stable
