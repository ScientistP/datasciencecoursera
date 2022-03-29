#1
add2 <-function (x,y){
  x+y
}

#add2(3,5)


#######################NEXT####################
above10 <- function(x){
  use  <- x >10  #logical vector
  x[use]  #subsets and returns x>10. If x<10 it reurns an empty numerical vector
}
#above10(20) #20
#above10(seq(4,15)) #[1] 11 12 13 14 15

#######################NEXT####################
above <- function(x,n){
  use <- x>n
  x[use] #subsets the vector x
}

# x <- 1:20
# above(x,12) #[1] 13 14 15 16 17 18 19 20
#######################NEXT####################

#specify a default value n=10
above <- function(x,n=10){
  use <- x>n #logical vector
  x[use]
}
# x <- 1:20
# above(x,12) #[1] 13 14 15 16 17 18 19 20
# above(x) # [1] 11 12 13 14 15 16 17 18 19 20

#######################NEXT####################
colummean <-function(y){ #y is a dataframe or a matrix
  nc <-ncol(y) #number of columns
  means <-numeric(nc) #initialize the loop. An empty numeric vector.To store the means for each coloumn
  for(i in 1:nc){ #for each column do the following
    means[i] <-mean(y[,i])  #calculates each column
  }
  means  #returns the vector of means
}

# matrix <- matrix(1:20, 4,5)
# colummean(matrix)
# here if matrix has NA values you also get NAs in the result
 csv<- read.csv("~/dev/datasciencecoursera/data/specdata/001.csv")
 x<-colummean(csv)
 
#######################NEXT####################
 #Getting rid of NAs
 
 colummean <-function(y, removeNA=TRUE){ #y is a dataframe or a matrix
   nc <-ncol(y) #number of columns
   means <-numeric(nc) #initialize the loop. An empty numeric vector.To store the means for each coloumn
   for(i in 1:nc){ #for each column do the following
     means[i] <-mean(y[,i], na.rm=removeNA)  #calculates each column
   }
   means  #returns the vector of means
 }
 
 # matrix <- matrix(1:20, 4,5)
 # colummean(matrix)
 # here if matrix has NA values you also get NAs in the result
 csv<- read.csv("~/dev/datasciencecoursera/data/specdata/001.csv")
 x<-colummean(csv)
 
########################NEXT####################
 #Choosing few files
 

 library(fs) #path
 
 id <- as.integer(c(1))
 dir_path <- path("~/dev/datasciencecoursera/data/specdata/")
 list_csv_name <-list.files(dir_path, pattern="csv")
 
 df <- data.frame(matrix(ncol =4, nrow = length(id)))
 colnames(df) <- c("Date", "sulfate", "nitrate", "ID")
 row_num <- 1
 
 for (j in id){
   print(j)
   file_name <- list_csv_name[j]
   print(file_name)
   csv<- read.csv(dir_path/file_name)
   # b <- as.integer(unlist(strsplit(x, ".", fixed=TRUE)))
   nc <-ncol(csv) #number of columns
   means <-numeric(nc) #initialize the loop. An empty numeric vector.To store the means for each coloumn
   
   for(i in 1:nc){ #for each column do the following
     means[i] <-(mean(csv[,i], na.rm=TRUE))
     print(means[i])
   }
   
   print(means)
   row.names(df)[row_num] <- file_name
   df[row_num, ]<- means
   row_num <- row_num +1 
 }
 
 for(i in 1:nc){ #for each column do the following
   means[i] <-(mean(df[,i], na.rm=TRUE))
   print(means[i])
 }
 library(glue)
 glue("These are the sulfate {means[2]} and nitrate {means[3]} overall values")
 
 
#######################NEXT####################
#a has no default values
f <- function(a,b=1,c=2,d=NULL){
  
}
#######################NEXT####################
#Lazy evaluation: all of the arguments to a function are only evaluated as they're needed
f <- function(a,b){
  a^2 #b is not used
}
#f(2)
#######################NEXT####################
#Lazy evaluation: all of the arguments to a function are only evaluated as they're needed
f <- function(a,b){
  print(a)
  print(b)
}
#f(2) 
#Error! argument "b" is missing
#######################NEXT####################
#... argument
#1. indicate a variable number of arguments that can sometimes be passed on to other functions. 
#It is used when extending another function and you don't want to copy the entire argument list of the original function. 
# so here you are only changing type from defualt of circular into line and leave the rest of arguments the same.
##any arguments after ... must be named explicitly
myplot <- function(x,y, type="l",...){
  plot(x,y, type=type, ...) #this is the original plot function
}

# 2: object oriented programming: Generic functions use ... so that extra arguments can be passed to methods
mean
function(x,...)
  UseMethod("mean")

# 3. when the number of arguments passed to the function cannot be known in advance such as in paste function
args(paste)
function(..., sep=" ", collapse=NULL) 
  
  args(cat)
function(..., file=" ", sep=" ", fill= FALSE, labels=NULL, append=FALSE)
  
  args(paste) 
function(..., sep=" ", collapse=NULL )
  #>paste("a","b", sep=":")
  #>paste("a","b", se=":") #partial matching getting ignored in paste function. but it can be partially matched in other functions. 
  #>So assumes : is another charactor to be stringed together. Any arugments after ... HAS TO be named explicitly.
  #######################NEXT####################

# Lexical SCOPING

#step 1
make.power <- function(n){ # n is a function argument
  pow <-function(x){ #x is a function argument.
    x^n  #n is a free variable. 
  }
  pow
}

# step2: now we make a second function that uses the above function
cube <- make.power(3)
square <-make.power(2)
#square(3) #3^2=9
#ls(environment(square)) #n , pow
#get("n", environment(square)) #2

#######################NEXT####################

# Dynamic SCOPING
#step 1
y<- 10
f <- function(x) {
  y <- 2  
  y^2 + g(x) # g and y is a free variable
}
#step 2
g <-function(x){
  x*y  #y is a free variable
}

#f(3)= 2^2+3*10=34

#######################NEXT####################
#Lexical Scoping (appears as if is is Dynamic)
g <- function(x){
  a<-3
  x+a+y
}
y <-3
g(2) #8


