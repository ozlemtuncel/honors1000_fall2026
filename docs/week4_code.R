# ==============================================================================
# Course: Introduction to Data Science with R (Fall 2026)
# Week 3: Workflow Basics, the Tidyverse, and Data Transformation
# Instructor: Dr. Ozlem Tuncel
# ==============================================================================
# Today, we are moving past simple calculators and diving into the "Tidyverse"!
# The tidyverse is a collection of packages designed specifically for data science.
# 
# We will focus on two major tools:
#   1. skimr: A package that gives beautiful, detailed summaries of your data.
#   2. dplyr: The ultimate "data manipulation" toolkit using clear verbs.
#
# Remember our core keyboard shortcuts to run code:
#   - Mac: Cmd + Return  |  Windows: Ctrl + Enter
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. LOADING OUR TOOLKITS
# ------------------------------------------------------------------------------
# Before we can manipulate data, we must tell R to open our packages.
# (Make sure these are installed on your computer first!)

library(tidyverse) # Loads dplyr, ggplot2, readr, etc.
library(skimr)     # Gives quick, powerful summaries of datasets


# ------------------------------------------------------------------------------
# 2. INTRODUCING OUR DATASET: A SIMULATED V-DEM SUBSET
# ------------------------------------------------------------------------------
# Real political datasets are huge. The full V-Dem dataset has over 4,500 variables!
# To keep things beginner-friendly, we are using a curated file tracking our core
# countries (United States, Turkey, Hungary, Denmark) and 4 important columns:
#   - country_name: Name of the country
#   - year: The calendar year of observation
#   - v2x_polyarchy: Electoral Democracy Index (0 = low, 1 = high)
#   - v2cacamps: Political Polarization (lower = low polarization, higher = extreme)

# Let's load our data from the project folder:
vdem_data <- read_csv("vdem_short.csv")

names(vdem_data)
nrow(vdem_data)
ncol(vdem_data)
min(vdem_data$year)
max(vdem_data$year)

# ------------------------------------------------------------------------------
# 3. QUICK INSPECTION WITH SKIMR: skim()
# ------------------------------------------------------------------------------
# Instead of clicking around a giant spreadsheet, the skim() function from the 
# skimr package gives a beautiful diagnostic report of the columns directly in your console.
# It tells you data types, missing values (NAs), means, and even a tiny histogram!

skim(vdem_data)


# ------------------------------------------------------------------------------
# 4. MASTERING THE DPLYR VERBS (DATA MANIPULATION)
# ------------------------------------------------------------------------------
# The dplyr package uses regular English verbs to reshape data frames. 
# To link these actions together in a clean sequence, we use the PIPE operator: %>%
# Think of the pipe `%>%` as the word "THEN". 
# Shortcut for Pipe: Mac = Cmd + Shift + M | Windows = Ctrl + Shift + M

# -----------------------------------------------------
# Verb A: select() — Choosing Columns
# Why use it? Databases have too many columns; select() isolates only the ones you need.
# -----------------------------------------------------
# Take vdem_data, THEN select only country_name and v2x_polyarchy columns:
just_democracy_scores <- vdem_data %>% 
  select(country_name, v2x_polyarchy)

head(just_democracy_scores)


# -----------------------------------------------------
# Verb B: rename() — Fixing Column Names
# Why use it? Codebooks use technical abbreviations (like v2x_polyarchy). Rename makes it human-readable!
# Syntax: rename(new_name = old_name)
# -----------------------------------------------------
vdem_clean_names <- vdem_data %>% 
  rename(democracy_score = v2x_polyarchy,
         polarization = v2cacamps)

colnames(vdem_clean_names)


# -----------------------------------------------------
# Verb C: filter() — Picking Rows Based on Conditions
# Why use it? If you only care about recent trends or specific countries, filter drops the rest.
# -----------------------------------------------------
# Let's look only at observations from the year 2020 or later:
recent_data <- vdem_data %>% 
  filter(year >= 2020)

recent_data

# Let's filter for just one specific country (Note the double equals sign '==' for exact matches!):
usa_only <- vdem_data %>% 
  filter(country_name == "United States of America")

head(usa_only)


# -----------------------------------------------------
# Verb D: mutate() — Creating New Columns
# Why use it? Sometimes you need to modify an existing variable or calculate something new.
# Let's transform polarization into a percentage style scale by multiplying it by 100.
# -----------------------------------------------------
vdem_with_new_col <- vdem_data %>% 
  mutate(polarization_scaled = v2cacamps * 100)

head(vdem_with_new_col)


# -----------------------------------------------------
# Verb E: summarise() — Compressing Data into a Snapshot
# Why use it? To calculate structural trends like average scores across groups.
# We often pair it with group_by() so R calculates the stats *per country*.
# -----------------------------------------------------
# Find the average democracy score for each country across history:
vdem_summary_table <- vdem_data %>% 
  group_by(country_name) %>% 
  summarise(avg_democracy = mean(v2x_polyarchy, na.rm = TRUE))

vdem_summary_table


# ------------------------------------------------------------------------------
# 5. TYING IT ALL TOGETHER: THE POWER OF PIPES
# ------------------------------------------------------------------------------
# Watch how beautiful R is when we stack everything into a single operational workflow:

final_insight_report <- vdem_data %>% 
  filter(year == 2025) %>% 
  select(country_name, v2x_polyarchy, v2cacamps) %>% 
  rename(democracy = v2x_polyarchy, polarization = v2cacamps) %>% 
  mutate(high_polarization = polarization > 1.5)

print(final_insight_report)


# ==============================================================================
# 🎯 YOUR TURN! (Asynchronous Practice Exercise)
# ==============================================================================
# Practice manipulating data using the verbs we unlocked today.
# Replace the blanks (_____) with your code and run each section.
# ==============================================================================

# Task 1: Use the skim() function to explore the built-in `msleep` dataset.
# skim(_____)
# hint: msleep <- msleep will create msleep data frame object

# Task 2: Filter the `vdem_data` data frame to keep ONLY rows belonging to "Hungary".
# hungary_rows <- vdem_data %>% 
#   filter(country_name == "_____")


# Task 3: Select only the `country_name`, `year`, and `v2cacamps` columns from `vdem_data`.
# polarization_subset <- vdem_data %>% 
#   select(_____, _____, _____)


# Task 4: Fix the blank below to rename `v2x_polyarchy` to `electoral_democracy_index`.
# vdem_renamed <- vdem_data %>% 
#   rename(electoral_democracy_index = _____)


# Task 5: Use group_by and summarise to find the maximum (max) polarization value 
# for each country in the dataset. Hint: use max(v2cacamps, na.rm = TRUE)
# polarization_max_table <- vdem_data %>% 
#   group_by(_____) %>% 
#   summarise(max_polarization = max(_____, na.rm = TRUE))