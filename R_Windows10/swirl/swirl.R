#################################################################################################
# Start
#################################################################################################


# Updated: 04/05/2020 
# Notes: 
# [1] re-do this exercise to better familiarize with R each time


#################################################################################################
# Environment
#################################################################################################


# clear up environment
ls()
rm(list = ls())


#################################################################################################
# Library
#################################################################################################


# set the library with the packages we use
library(swirl)


#################################################################################################
# Course
#################################################################################################


# install the course
# 14.740x uses the same swirl course as 14.310x
install_course_zip("swirl/14_740x_Intro_to_R.zip", multi = FALSE)
install_course_zip("swirl/14_740x_Advanced_R.zip", multi = FALSE)


#################################################################################################
# Swirl
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


# Recall that `!` gives us the negation of a logical expression, so !is.na(x) can be read as 'is not NA'. 
# Therefore, if we want to create a vector
# called y that contains all of the non-NA values from x, we can use y <- x[!is.na(x)]. Give it a try.
y <- x[!is.na(x)]


# Subset the 3rd, 5th, and 7th elements of x? Hint -- Use the c() function to specify the element numbers as a numeric vector
x[c(3,5,7)]


# It's important that when using integer vectors to subset our vector x, we stick with the set of indexes {1, 2, ..., 40} since x only has 40 elements. 
# What happens if we ask for the zeroth element of x (i.e. x[0])? Give it a try.
x[0]
# What if we ask for the 3000th element of x?
x[3000]
# Again, nothing useful, but R doesn't prevent us from asking for it. This should be a cautionary tale. 
# You should always make sure that what you are asking for is within the bounds of the vector you're working with.


# What if we're interested in all elements of x EXCEPT the 2nd and 10th? 
# It would be pretty tedious to construct a vector containing all numbers 1 through 40 EXCEPT 2 and 10.
# Luckily, R accepts negative integer indexes. 
# Whereas x[c(2, 10)] gives us ONLY the 2nd and 10th elements of x, x[c(-2, -10)] gives us all elements of x EXCEPT for the 2nd and 10 elements
x[c(-2,-10)]
# OR
x[-c(2,10)]


# Create a numeric vector with three named elements using:
vect <- c(foo = 11, bar = 2, norf = NA)
# We can also get the names of vect by passing vect as an argument to the names() function
names(vect)
# Alternatively, we can create an unnamed vector vect2 with c(11, 2, NA). Do that now.
vect2 <- c(11,2,NA)
# Then, we can add the `names` attribute to vect2 after the fact with names(vect2) <- c("foo", "bar", "norf")
names(vect2) <- c("foo", "bar", "norf")
# Now, let's check that vect and vect2 are the same by passing them as arguments to the identical() function.
identical(vect, vect2)
# Which of the following commands do you think would give us the second element of vect?
vect["bar"]
# Likewise, we can specify a vector of names with vect[c("foo", "bar")]. Try it out.
vect[c("foo", "bar")]


######################################
# 8: Matrices and Data Frames 
######################################


# In this lesson, we'll cover matrices and data frames. 
# Both represent 'rectangular' data types, meaning that they are used to store tabular data, with rows and columns
# The main difference: 
# [1]matrices can only contain a single class of data
# [2]data frames can consist of many different classes of data


# Create a vector containing the numbers 1 through 20 using the `:` operator. Store the result in a variable called my_vector
my_vector <- 1:20
dim(my_vector)
length(my_vector)
dim(my_vector) <- c(4,5)
attributes(my_vector)
class(my_vector)
# The example that we've used so far was meant to illustrate the point that a matrix is simply an atomic vector with a dimension attribute
# A more direct method of creating the same matrix uses the matrix() function


# Bring up the help file for the matrix() function now using the `?` function
?matrix
# Create a matrix containing the same numbers (1-20) and dimensions (4 rows, 5 columns) by calling the matrix() function
# Store the result in a variable called my_matrix2
my_matrix2 <- matrix(1:20, nrow = 4, ncol = 5)
identical(my_matrix, my_matrix2)


# Imagine that the numbers in our table represent some measurements from a clinical experiment, 
# where each row represents one patient and each column represents one variable for which measurements were taken
patients <- c("Bill", "Gina", "Kelly", "Sean")
# Use the cbind() function to 'combine columns' call cbind() with two arguments -- the patients vector and my_matrix
cbind(patients, my_matrix)
# How to include the names of our patients in the table without destroying the integrity of our numeric data
# Try the following:
my_data <- data.frame(patients, my_matrix)
class(my_data)
cnames <- c("patient", "age", "weight", "bp", "rating", "test")
colnames(my_data) <- cnames


######################################
# 9: Looking at Data     
######################################


# Whenever you're working with a new dataset, the first thing you should do is look at it!
# What is the format of the data?
# What are the dimensions? What are the variable names? How are the variables stored? 
# Are there missing data?
# Are there any flaws in the data?


# This lesson will teach you how to answer these questions and more using R's built-in functions
# Dataset constructed from the United States Department of Agriculture's PLANTS Database (http://plants.usda.gov/adv_search.html)


class(plants)


# Since the dataset is stored in a data frame, we know it is rectangular
# In other words, it has two dimensions (rows and columns) and fits neatly into a table or spreadsheet
# Use this to find out:
dim(plants)
# The first number you see (5166) is the number of rows (observations) and the second number (10) is the number of columns (variables)
# View the number of rows(observations)
nrow(plants)
# View the number of columns(variables)
ncol(plants)


# If you are curious as to how much space the dataset is occupying in memory, you can use:
object.size(plants)


# We have shape and size, get a feel for what is inside
names(plants)
# Take a look inside 
head(plants, 10)
tail(plants, 15)
# After previewing the top and bottom of the data, you probably noticed lots of NAs, which are R's placeholders for missing values
# Use this to get a better feel for how each variable is distributed and how much of the dataset is missing:
summary(plants)
# summary() provides different output for each variable, depending on its class
# For numeric data such as Precip_Min, summary() displays the minimum, 1st quartile, median, mean, 3rd quartile, and maximum
# These values help us understand how the data are distributed
# For categorical variables (called 'factor' variables in R), summary() displays the number of times each value (or 'level') occurs
# For example, each value of Scientific_Name only appears once, since it is unique to a specific plant
# In contrast, the summary for Duration (also a factor variable) tells us that our dataset contains:
# 3031 Perennial plants, 682 Annual plants, etc


# R truncated the summary for Active_Growth_Period by including a catch-all category called 'Other'
# Since it is a categorical/factor variable, we can see how many times each value actually occurs in the data with:
table(plants$Active_Growth_Period)


str(plants)
# The beauty of str() is that it combines many of the features of the other functions you've already seen, all in a concise and readable format
# At the very top, it tells us that the class of plants is 'data.frame' and that it has 5166 observations and 10 variables
# It then gives us the name and class of each variable, as well as a preview of its contents


######################################
# 10: Base Graphics           
######################################


# One of the greatest strengths of R, relative to other programming languages, is the ease with which we can create publication-quality graphics
# In this lesson, you'll learn about base graphics in R
# We do not cover the more advanced portions of graphics in R in this lesson. These include lattice, ggplot2 and ggvis


# There is a school of thought that this approach is backwards, that we should teach ggplot2 first
# See http://varianceexplained.org/r/teach_ggplot2_to_beginners/ for an outline of this view


# Reel er in
data(cars)


# Check out the help page
?cars
# As you can see in the help page, the cars data set has only two variables: speed and stopping distance
# Note that the data is from the 1920s


# Run head() function to run the top 6 results 
head(cars)


# Before plotting, it is always a good idea to get a sense of the data
# Key R commands for doing so include, dim(), names(), head(), tail() and summary()


# Okay, run plot
plot(cars)
# As always, R tries very hard to give you something sensible given the information that you have provided to it
# First, R notes that the data frame you have given it has just two columns, so it assumes that you want to plot one column versus the other
# Second, since we do not provide labels for either axis, R uses the names of the columns
# Third, it creates axis tick marks at nice round numbers and labels them accordingly
# Fourth, it uses the other defaults supplied in plot()
# and take into consideration - plot is short for scatterplot


?plot
# The help page for plot() highlights the different arguments that the function can take
# The two most important are x and y, 
# the variables that will be plotted


# For the next set of questions, include the argument names in your answers
# That is, do not type plot(cars$speed, cars$dist), although that will work. 
# Instead, use: 
plot(x = cars$speed, y = cars$dist)
# Note that this produces a slightly different answer than plot(cars)
# In this case, R is not sure what you want to use as the labels on the axes, 
# so it just uses the arguments which you pass in, data frame name and dollar signs included
# Note that there are other ways to call the plot command, i.e., using the "formula" interface
# For example, we get a similar plot to the above with 
plot(dist ~ speed, cars)
# However, we will wait till later in the lesson before using the formula interface
# Use plot() command to show dist on the x-axis and speed on the y-axis from the cars data frame
# This is the opposite of what we did above
plot(x = cars$dist, y = cars$speed)


# Assign accordingly


# Assign Speed as the xLabel
plot(x = cars$speed, y = cars$dist, xlab = "Speed", ylab = "Stopping Distance")
plot(cars, main = "My Plot")
plot(cars, sub = "My Plot Subtitle")

# Plot the data points in cars as red
plot(cars, col = 2)


# Plot cars while limiting the x-axis to 10 through 15 (Use xlim = c(10, 15) to achieve this effect.)
plot(cars, xlim = c(10, 15))


# You can also change the shape of the symbols in the plot
# The help page for points (?points) provides the details
?points


# Plot cars using triangles. (Use pch = 2 to achieve this effect.)
plot(cars, pch = 2)


# Reel er in 
data(mtcars)


# Anytime that you load up a new data frame, you should explore it before using it
# In the middle of a swirl lesson, just type play()
# This temporarily suspends the lesson (without losing the work you have already done) and allows you to issue commands like:
# dim(mtcars) and head(mtcars)
# Once you are done examining the data, just type nxt() and the lesson will pick up where it left off


# Type ?boxplot or help(boxplot) to view a help page with details about boxplot
?boxplot
# boxplot(), like many R functions, also takes a "formula" argument, generally an expression with a tilde ("~") which indicates the relationship between the input variables
# This allows you to enter something like mpg ~ cyl to plot the relationship between cyl (number of cylinders) on the x-axis and mpg (miles per gallon) on the y-axis
# Use boxplot() with formula = mpg ~ cyl and data = mtcars to create a box plot
boxplot(formula = mpg ~ cyl, data = mtcars)
# The plot shows that mpg is much lower for cars with more cylinders
# Note that we can use the same set of arguments that we explored with plot() above to add axis labels, titles and so on


# When looking at a single variable, histograms are a useful tool
# hist() is the associated R function
# Like plot(), hist() is best used by just passing in a single vector
hist(mtcars$mpg)


# In this lesson, you learned how to work with base graphics in R
# The best place to go from here is to study the ggplot2 package
# If you want to explore other elements of base graphics, then this web page (http://www.ling.upenn.edu/~joseff/rstudy/week4.html)


# Any operation involving NA generally yields NA as the result
# To illustrate, let's create a vector c(44, NA, 5, NA) and assign it to a variable x
x <- c(44,NA,5,NA)
# multiply x by 3
x*3
# [1] 132  NA  15  NA





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
# End
#################################################################################################