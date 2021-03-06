input_file = file("input2017_20.txt", "r")
input <- ""
while ( TRUE ) {
  line = readLines(input_file, n = 1)
  if ( length(line) == 0 ) {
    break
  }
  
  if (input[1] == "") {
    input <- line
  } else {
    input <- c(input, line)  
  }
  
}
close(input_file)

#input <- c("p=<3,0,0>, v=<2,0,0>, a=<-1,0,0>", "p=<4,0,0>, v=<0,0,0>, a=<-2,0,0>") #test input

input <- gsub("[a-z]=<", "", input) #removes letter=<
input <- gsub(">| ", "", input) #removes > and spaces

particles <- list()

for (l in 1:length(input)) { #init all particles
  line <- input[l]
  line <- as.numeric(unlist(strsplit(line, ",")))
  particles[[l]] <- list(p=c(line[1], line[2], line[3]), v=c(line[4], line[5], line[6]), a=c(line[7], line[8], line[9])) #create particle
}

closest_dist <- 2 ^ .Machine$double.digits #set as double.max (sort of)
closest_name <- ""

counter <- 0
last_change <- 0

while ((counter - last_change) <= 1000) { #while not 1000 iterations withou change of closest (not foolproof)
  new_closest_dist <- 2 ^ .Machine$double.digits #smallest of each iteration (because they all grow)
  new_closest_name <- ""
  
  for (part in 1:length(particles)) {
    particles[[part]]$v <- particles[[part]]$v + particles[[part]]$a #update velocity using acceleration
    particles[[part]]$p <- particles[[part]]$p + particles[[part]]$v #update position using velocity
    
    new_dist <- sum(abs(particles[[part]]$p))
    
    if (new_dist < new_closest_dist) { #if manhattan dist smaller than current closest
      new_closest_dist <- new_dist
      new_closest_name <- part - 1 #-1 because we start counting from 1 (not from 0)
    }
  }
  
  if (new_closest_name != closest_name) { #if smallest of this iteration is differnt than from previous
    closest_dist <- new_closest_dist #addjust
    closest_name <- new_closest_name
    
    last_change <- counter #reset counter of iterations without change
  }
  
  counter <- counter + 1
  
  #this is flawed, waiting for x iterations withou change is dumb
  #how about biggest manhattan dist of acc (nvm, need for part 2)
}


#part two
# input <- c("p=<-6,0,0>, v=<3,0,0>, a=<0,0,0>", "p=<-4,0,0>, v=<2,0,0>, a=<0,0,0>", "p=<-2,0,0>, v=<1,0,0>, a=<0,0,0>", "p=<3,0,0>, v=<-1,0,0>, a=<0,0,0>") #test input
# input <- gsub("[a-z]=<", "", input) #removes letter=<
# input <- gsub(">| ", "", input) #removes > and spaces

particles2 <- list()

for (l in 1:length(input)) { #init all particles (for part two)
  line <- input[l]
  line <- as.numeric(unlist(strsplit(line, ",")))
  particles2[[l]] <- list(p=c(line[1], line[2], line[3]), v=c(line[4], line[5], line[6]), a=c(line[7], line[8], line[9])) #create particle
}

names(particles2) <- 1:length(particles2)

counter2 <- 0
last_collision <- 0

while ((counter2 - last_collision) <= 50) { #while not 50 iterations withou collision (not foolproof)
  for (part in names(particles2)) { #update all particles
    particles2[[part]]$v <- particles2[[part]]$v + particles2[[part]]$a #update velocity using acceleration
    particles2[[part]]$p <- particles2[[part]]$p + particles2[[part]]$v #update position using velocity
  }
  
  dups <- numeric() #duplicates
  all_names <- names(particles2)

  if (length(particles2) > 1) {
    for (i in 1:(length(all_names)-1)) { #find all collision (same postion) (i know, not optimal)
      p <- particles2[[all_names[i]]]$p
      for (j in (i+1):length(all_names)) {
        if (all(particles2[[all_names[j]]]$p == p)) {
          dups <- c(dups, all_names[j], all_names[i]) #we can repeat i, doesnt matter
        }
      }
    }
  }
  
  for (d in dups) { #remove all collisions
    particles2[[d]] <- NULL
    last_collision <- counter2
  }
  
  counter2 <- counter2 + 1
  
  #DONT WORRY, TAKES A WHILE (like 5 min)
}

num_left <- length(particles2)


closest_name

num_left