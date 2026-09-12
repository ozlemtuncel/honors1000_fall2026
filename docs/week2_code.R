# ==============================================================================
# Course: Introduction to Data Science with R (Fall 2026)
# Week 2: R Basics — Math, Objects, Functions, and Packages
# Instructor: Dr. Ozlem Tuncel
# ==============================================================================
# Welcome to your first hands-on R coding session! 
# 
# Pro Tip: Any line starting with a hashtag '#' is a COMMENT.
# R will ignore it. We use comments to leave notes for humans (and ourselves)!
#
# How to run code:
# Put your cursor on a line and press:
#   - Mac: Cmd + Return
#   - Windows: Ctrl + Enter
# ==============================================================================


# ------------------------------------------------------------------------------
# 1. R AS A SIMPLE CALCULATOR
# ------------------------------------------------------------------------------
# You can use R just like a standard desktop calculator.

# Addition and Subtraction
2 + 2
# The result should be 6
10 - 4 

# Multiplication (*) and Division (/)
5 * 5
5*5
100 / 4

# Order of operations (PEMDAS applies!)
(10 + 2) / 3


# ------------------------------------------------------------------------------
# 2. CREATING OBJECTS (THE ASSIGNMENT OPERATOR: <-)
# ------------------------------------------------------------------------------
# In data science, we don't want to retype numbers all day. 
# We store values inside "objects" (think of them as labeled storage boxes).
# We use the assignment arrow `<-` (less-than sign + hyphen).
# Shortcut: Mac = Option + Minus (-) | Windows = Alt + Minus (-)

# Let's store a simple number:
my_favorite_number <- 7
MyFavoriteNumber <- 7

# Notice that `my_favorite_number` now appears in your Environment pane (top right)!
# To see what is inside an object, just type its name:
my_favorite_number

# We can also store words (text strings). Always wrap text in quotation marks:
my_school <- "Georgia State University"
my_school

# IMPORTANT RULE: R is strictly case-sensitive!
# Uncomment the line below to see what happens when capitalization is wrong:
# My_favorite_number  # Error: object 'My_favorite_number' not found


# ------------------------------------------------------------------------------
# 3. COMBINING VALUES INTO A VECTOR: The c() FUNCTION
# ------------------------------------------------------------------------------
# What if we want to store more than one number in a single box?
# We use the `c()` function (short for "combine" or "concatenate").

# Let's store democracy scores for 4 countries (scale from 0 to 1):
# Denmark (0.94), United States (0.74), Hungary (0.35), Turkey (0.12)
democracy_scores <- c(0.94, 0.74, 0.35, 0.12)
democracy_scores

# We can also combine country names:
country_names <- c("Denmark", "United States", "Hungary", "Turkey")
country_names


# ------------------------------------------------------------------------------
# 4. BASIC FUNCTIONS: MAKING R DO WORK FOR YOU
# ------------------------------------------------------------------------------
# A function takes an input (inside parentheses), does something, and returns an output.

# Calculate the average (mean) score:
mean(democracy_scores)

# Find the highest (max) and lowest (min) scores:
max(democracy_scores)
min(democracy_scores)

# How many items are in our vector?
length(democracy_scores)

# Rounding numbers:
round(3.14159, digits = 2)


# ------------------------------------------------------------------------------
# 5. INSPECTING DATA: head(), tail(), AND str()
# ------------------------------------------------------------------------------
# R comes with built-in datasets for practicing. Let's look at one called `mtcars`.

# View the first 6 rows (the "head" of the dataset):
head(mtcars)

# View the last 6 rows (the "tail" of the dataset):
tail(mtcars)

# Check the structure (how many rows, columns, and variable types):
str(mtcars)


# ------------------------------------------------------------------------------
# 6. GETTING HELP IN R (?)
# ------------------------------------------------------------------------------
# Don't know what a function does? Put a question mark `?` before its name!
# Look at the "Help" tab in the bottom-right pane after running this line:

?mean
?head


# ------------------------------------------------------------------------------
# 7. INSTALLING AND LOADING PACKAGES (TOOLKITS)
# ------------------------------------------------------------------------------
# Think of R as a brand-new smartphone:
# - `install.packages()` is like downloading an app from the App Store (you do this ONCE).
# - `library()` is like opening the app so you can use it (you do this EVERY session).

# Let's install the nycflights13 dataset package (remove the '#' to run if needed):
# install.packages("nycflights13")

# Now open (load) the package into our workspace:
library(nycflights13)

# Check each unique dataset in the data
nycflights13::airlines
nycflights13::airports
nycflights13::flights
nycflights13::planes
nycflights13::weather

# Save flights as an object
flights <- nycflights13::flights

# Let's inspect our new nycflights13 dataset using the functions we learned:
head(flights)
str(flights)


# ==============================================================================
# 🎯 YOUR TURN! (Asynchronous Practice Exercise)
# ==============================================================================
# Practice what you learned today by completing the tasks below.
# Replace the blanks (_____) with your own code and run each line.
# ==============================================================================

# Task 1: Create an object named `my_age` and store your age inside it.
# my_age <- _____
# my_age


# Task 2: Below are the Freedom of Expression index scores (scale: 0 to 1)
# for Sweden (0.97), United States (0.85), Hungary (0.42), and Turkey (0.18).
# Combine these four numbers into a vector called `expression_scores`.
# expression_scores <- c(_____, _____, _____, _____)


# Task 3: Calculate the average (mean) of `expression_scores`.
# mean(_____)


# Task 4: Find the minimum score in `expression_scores`.
# min(_____)


# Task 5: Look up the help documentation for the `round` function.
# ?_____