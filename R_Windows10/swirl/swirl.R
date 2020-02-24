#################################################################################################
                            #Start
#################################################################################################
# Updated: 02/19/2020 ~00
# Notes: 
# - re-do this exercise to better familiarize with R each time


#################################################################################################
                              #Environment
#################################################################################################

# clear up environment
ls()
rm(list = ls())


#################################################################################################
                              #Library
#################################################################################################

# set the library with the packages we use
library(swirl)


#################################################################################################
                              #Course
#################################################################################################

# install the course
# 14.740x uses the same swirl course as 14.310x
install_course_zip("swirl/14_740x_Intro_to_R.zip", multi = FALSE)
install_course_zip("swirl/14_740x_Advanced_R.zip", multi = FALSE)


#################################################################################################
                              #Swirl
#################################################################################################

# run swirl
swirl()


# "What should I call you?"
thisgirlsara


# will open a menu of resources (either within RStudio or your default web browser, depending on your setup)
help.start()


# to get a list of navigation options
info()


# R's built-in help files via the `?` command 
?list.files
# in the case of a special character operator (like a colon), you must enclose the symbol in backticks like this:
?`:` 
# NOTE: The backtick (`) key is generally located in the top left corner of a keyboard, above the Tab key
# If you don't have a backtick key, you can use regular quotes.)


# Temporarily, leave the lesson by typing 
play() 
# and then return by typing 
nxt()


#################################################################################################
                              # 14 310x Intro to R
#################################################################################################

######################################
# 1: Welcome  
######################################

# just some faq
# each of these modules is about 15-20 min long


######################################
# 2: Basic Building Blocks  
######################################

# arithmetic expressions
# arithmetic operators are `+`, `-`, `/`, and `^` 
# sqrt() function 
# abs() function 


# create a variable
x <- 5 + 7
x


# create a vector 
# uses c() function, which stands for 'concatenate' or 'combine'
z <- c(1.1, 9, 3.14)
z
# Numeric vectors can be used in arithmetic expressions
z * 2 + 100 
# When given two vectors of the same length, R simply performs the specified arithmetic operation (`+`, `-`, `*`, etc.) element-by-element. 
# If the vectors are of different lengths, R 'recycles' the shorter vector until it is the same length as the longer vector.


######################################
# 3: Workspace and Files            
######################################

# Determine which directory your R session is using as its current working directory using getwd()
getwd()


# List all the objects in your local workspace using ls()
ls()


# List all the files in your working directory using list.files() or dir()
list.files()
dir()


# Using the args() function on a function name is also a handy way to see what arguments a function can take
args(list.files)


# Assign the value of the current working directory to a variable called "old.dir"
old.dir <- getwd()


# Use dir.create() to create a directory in the current working directory called "testdir"
dir.create("testdir")


# Set your working directory to "testdir" with the setwd() command
setwd("testdir/")


# In general, you will want your working directory to be someplace sensible, perhaps created for the specific project that you are working on
# In fact, organizing your work in R packages using RStudio is an excellent option
# Check out RStudio at http://www.rstudio.com/


# Create a file in your working directory called "mytest.R" using the file.create() function
file.create("mytest.R")


# Check to see if "mytest.R" exists in the working directory using the file.exists() function
file.exists("mytest.R")


# Access information about the file "mytest.R" by using file.info()
file.info("mytest.R")
# You can use the $ operator to grab specific items
file.info("mytest.R")$mode


# Rename of the file "mytest.R" to "mytest2.R" by using file.rename()
file.rename("mytest.R", "mytest2.R")


# Copy the file "mytest2.R" to "mytest3.R" by using file.copy()
file.copy("mytest2.R", "mytest3.R")


# Provide the relative path to the file "mytest3.R" by using file.path()
file.path("mytest3.R")


# You can use file.path to construct file and directory paths that are independent of the operating system your R code is running on
# Pass 'folder1' and 'folder2' as arguments to file.path to make a platform-independent pathname
file.path("folder1", "folder2")


# Take a look at the documentation for dir.create by entering ?dir.create . Notice the 'recursive' argument
# In order to create nested directories, 'recursive' must be set to TRUE
?dir.create


# Create a directory in the current working directory called "testdir2" and a subdirectory for it called "testdir3", 
# all in one command by using dir.create() and file.path()
dir.create(file.path('testdir2', 'testdir3'), recursive = TRUE)


# To delete a directory you need to use the recursive = TRUE argument with the function unlink(). If you don't use recursive = TRUE, 
# R is concerned that you're unaware that you're deleting a directory and all of its contents
# R reasons that, if you don't specify that recursive equals TRUE, you don't know that something is in the directory you're trying to delete
# R tries to prevent you from making a mistake
# history: unlink is the traditional Unix command for removing directories
# Delete the "testdir2" directory that you created by using unlink()
unlink("testdir2", recursive = TRUE)


# Go back to your original working directory using setwd()
setwd(old.dir)


######################################
# 4: Sequences of Numbers     
######################################

# The simplest way to create a sequence of numbers in R is by using the `:` operator
# Type 1:20 to see how it works
1:20
# count backwards in increments of 1
15:1


# Create a sequence of real numbers
# Type pi:10 to see how it works
pi:10 
# The result is a vector of real numbers starting with pi (3.142...) and increasing in increments of 1
# The upper limit of 10 is never reached, since the next number in our sequence would be greater than 10


# The most basic use of seq() does exactly the same thing as the `:` operator 
# Try seq(1, 20) to see this
seq(1,20)
# However, let's say that instead we want a vector of numbers ranging from 0 to 10, incremented by 0.5
seq(0, 10, by=0.5) 
# Or maybe we don't care what the increment is and we just want a sequence of 30 numbers between 5 and 10
my_seq <- seq(5, 10, length=30)


# To confirm that my_seq has length 30, we can use the length() function
length(my_seq)


# Let's pretend we don't know the length of my_seq, but we want to generate a sequence of integers from 1 to N, 
# where N represents the length of the my_seq vector
# In other words, we want a new vector (1, 2, 3, ...) that is the same length as my_seq (increments by 1 uses length of my_seq)
1:length(my_seq)
# Another option is to use 
# creates a sequence that matches along with my_seq
seq(along.with = my_seq)
# However, as is the case with many common tasks, R has a separate built-in function for this purpose called seq_along()
seq_along(my_seq)


# One more function related to creating sequences of numbers is rep(), which stands for 'replicate'
# If we're interested in creating a vector that contains 40 zeros, we can use:
rep(0, times = 40)
# If instead we want our vector to contain 10 repetitions of the vector (0, 1, 2), we can do:
rep(c(0, 1, 2), times = 10)
# Finally, let's say that rather than repeating the vector (0, 1, 2) over and over again, 
# we want our vector to contain 10 zeros, then 10 ones, then 10 twos. We can do this with the `each` argument. 
rep(c(0, 1, 2), each = 10)


######################################
# 5: Vectors                  
######################################

# The simplest and most common data structure in R is the vector
# Vectors come in two different flavors: atomic vectors and lists
# An atomic vector contains exactly one data type, whereas a list may contain multiple data types. 
# In previous lessons, we dealt entirely with numeric vectors, which are one type of atomic vector
# Other types of atomic vectors include logical, character, integer, and complex. 
# In this lesson, we'll take a closer look at logical and character vectors.
# Logical vectors can contain the values TRUE, FALSE, and NA (for 'not available')
# These values are generated as the result of logical 'conditions'


# create a numeric vector num_vect that contains the values 0.5, 55, -10, and 6
num_vect <- c(0.5 ,55 ,-10 ,6)
# create a variable called tf that gets the result of num_vect < 1, which is read as 'num_vect is less than 1'
# if greater than 1 false, if less than 1 true 
# a vector of 4 logical values
tf <- num_vect < 1


# The `<` and `>=` symbols in these examples are called 'logical operators'
# Other logical operators include `>`, `<=`, `==` for exact equality, and `!=` for inequality
# If we have two logical expressions, A and B, we can ask whether at least one is TRUE with A | B (logical 'or' a.k.a. 'union') 
# or whether they are both TRUE with A & B (logical 'and' a.k.a. 'intersection')
# Lastly, !A is the negation of A and is TRUE when A is FALSE and vice versa.


# Predict the following statements #'s 1-3
# Your job is to figure out if that is an accurate statement
# If so, the entire condition is TRUE
# If not, it's FALSE

# 1
# (3 > 5) & (4 == 4)
1 # TRUE
2 # FALSE
# Selection:
2

# 2
# (TRUE == TRUE) | (TRUE == FALSE)
# Break this problem down into 2 pieces 
# The `|` in the middle states that AT LEAST ONE of the pieces is TRUE
1 # TRUE
2 # FALSE
# Selection:
1

# 3
# ((111 >= 111) | !(TRUE)) & ((4 + 1) == 5)
1 # FALSE
2 # TRUE
# Selection: 
1


# Character vectors are also very common in R. Double quotes are used to distinguish character objects
# Create a character vector that contains the following words: "My", "name", "is"
# Remember to enclose each word in its own set of double quotes, so that R knows they are character strings 
# Store the vector in a variable called my_char
my_char <- c("My", "name", "is")

# Right now, my_char is a character vector of length 3 
# Let's say we want to join the elements of my_char together into one continuous character string (i.e. a character vector of length 1) 
# We can do this using the paste() function
# The `collapse` argument to the paste() function tells R that when we join together the elements of the my_char character vector, 
# we'd like to separate them with single space 
paste(my_char, collapse = " ")

# To add (or 'concatenate') your name to the end of my_char, use the c() function like this: c(my_char, "your_name_here")
# Place your name in double quotes where I've put "your_name_here"
# Try it now, storing the result in a new variable called my_name
my_name <- c(my_char, "Sara")

# In this example, we used the paste() function to collapse the elements of a single character vector
# paste() can also be used to join the elements of multiple character vectors 
# In the simplest case, we can join two character vectors that are each of length 1 (i.e. join two words)
# Try paste("Hello", "world!", sep = " "), where the `sep` argument tells R that we want to separate the joined elements with a single space
paste("Hello", "world!", sep = " ")

# For a slightly more complicated example, we can join two vectors, each of length 3
# Use paste() to join the integer vector 1:3 with the character vector c("X", "Y", "Z")
# This time, use sep = "" to leave no space between the joined elements
paste(1:3, c("X", "Y", "Z"), sep = "")

# What do you think will happen if our vectors are of different length?
# Vector recycling! 
# Try paste() where LETTERS is a predefined variable in R containing a character vector of all 26 letters in the English alphabet
paste(LETTERS, 1:4, sep = "-")
# Result in console snippet: "A-1" "B-2" "C-3" "D-4" "E-1" "F-2" "G-3" "H-4"
# Also worth noting is that the numeric vector 1:4 gets 'coerced' into a character vector by the paste() function
# all it really means is that the numbers 1, 2, 3, and 4 in the output above are no longer numbers to R, 
# but rather characters "1", "2", "3", and "4"


######################################
# 6: Missing Values           
######################################

# In R, NA is used to represent any value that is 'not available' or 'missing' (in the statistical sense)
# In this lesson, we'll explore missing values further
# Any operation involving NA generally yields NA as the result
x <- c(44, NA, 5, NA)
# Now, let's multiply x by 3 (this shows that 3 does not effect NA)
x*3
# [1] 132  NA  15  NA
# lets create a vector containing 1000 draws from a standard normal distribution with:
y <- rnorm(1000)
# Next, let's create a vector containing 1000 NAs with 
z <- rep(NA, 1000)
# Finally, let's select 100 elements at random from these 2000 values (combining y and z) such that we don't 
# know how many NAs we'll wind up with or what positions they'll occupy in our final vector -- 
my_data <- sample(c(y, z), 100)


# Let's first ask the question of where our NAs are located in our data
# The is.na() function tells us whether each element of a vector is NA
# Call is.na() on my_data and assign the result to my_na
my_na <- is.na(my_data)
# BTW logical operators, the `==` operator as a method of testing for equality between two objects might think the expression 
my_data == NA 
# yields the same results as is.na()


# Call the sum() function on my_na to count the total number of TRUEs in my_na, and thus the total number of NAs
sum(my_na)


# a second type of missing value -- NaN, which stands for 'not a number'
# To generate NaN, try dividing (using a forward slash) 0 by 0 now
0/0


# In R, Inf stands for infinity
# What happens if you subtract Inf from Inf?
Inf - Inf 


######################################
# 7: Subsetting Vectors       
######################################

# In this lesson, we'll see how to extract elements from a vector based on some conditions that we specify
# For example, we may only be interested in the first 20 elements of a vector, or only the elements that are not NA, 
# or only those that are positive or correspond to a specific variable of interest


# x from #6 is used 
# For a simple example, try x[1:10] to view the first ten elements of x.
x[1:10]


# Index vectors come in four different flavors -- 
# 1- logical vectors, 
# 2 - vectors of positive integers, 
# 3 - vectors of negative integers,
# 4 - vectors of character strings 





######################################
# 8: Matrices and Data Frames 
######################################
######################################
# 9: Looking at Data     
######################################
######################################
# 10: Base Graphics           
######################################
######################################
# 11: Manipulating Data with dplyr
######################################
######################################
# 12: Getting and Cleaning Data 
######################################
######################################
# 13: Tidying Data with tidyr
######################################


#################################################################################################
                              # 14 310x Advanced R
#################################################################################################

######################################
# 1: Welcome        
######################################
######################################
# 2: Logic                            
######################################
######################################
# 3: Functions           
######################################
######################################
# 4: lapply and sapply             
######################################
######################################
# 5: vapply and tapply                
######################################
######################################
# 6: Simulation                       
######################################
######################################
# 7: Dates and Times   
######################################
######################################
# 8: Dates and Times with lubridate
######################################
######################################
# 9: Principles of Analytic Graphs   
######################################
######################################
# 10: Exploratory Graphs              
######################################
######################################
# 11: Graphics Devices in R           
######################################
######################################
# 12: Plotting Systems              
######################################
######################################
# 13: Base Plotting System            
######################################
######################################
# 14: Lattice Plotting System         
######################################
######################################
# 15: Working with Colors             
######################################
######################################
# 16: GGPlot2 Part1                 
######################################
######################################
# 17: GGPlot2 Part2                   
######################################
######################################
# 18: GGPlot2 Extras    
######################################


#################################################################################################
                            #End
#################################################################################################