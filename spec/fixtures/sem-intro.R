#* Introduction to R

# The best way to learn R from scratch is by installing and running the
# [Swirl](https://swirlstats.com/students.html) tutorials in RStudio. Here, we
# review the most basic essentials to R.

# Variables: R allows you to store data, values, and results of your analyses
# in variables. Here is an example of how to assign values to variables:

value <- 5
construct_name <- "PO"

# Collections: Multiple values can be defined and stored together. Vectors are
# collections of simple values (numbers, characters). Lists are collections of
# simple values or even other collections



# Vector of five numbers
numbers <- c(1, 2, 3, 4, 5)

# Vector of characters (letters or numbers in quotes)
construct_names <- c("PO", "PI")

# List of values and vectors
construct_definition <- list(
  name = "Purchase Intention",
  items = c("pi_1", "pi_2", "pi_3", "pi_4"))

# We can then extract what we have stored in these collections as we need them.

construct_names[2]

construct_definition$items

# Operations: Simple mathematical operations can be computed on values
# (numbers, words, etc.) or on variables. R is specially suited to performing
# operations on vectors (like our `numbers` from above).

5 * 2

numbers <- 1:5

numbers^2

# Functions: Complex operations that require more information to compute are
# often packaged as functions. These function takes arguments and return results
# that can be stored in variables or displayed on screen. Note that comments
# (descriptive text that does not run) is prefixed with a pound sign ("#").



# load data from a file into a variable using the "read.csv" function
influence_data <- read.csv("data/influencer_data_book_final.csv")

# run a regression analysis
influence_regr <- lm(formula = pi_1 ~ pq_1 + sic_1, data = influence_data)

# show a summary of results from the regression on screen
summary(influence_regr)

# save the summary to a variable for further inspection
regr_report <- summary(influence_regr)

# Variables, like the regression report we are storing in `regr_report`, often
# contain a deeper structure of values that one can inspect:

regr_report$r.squared

#* Introduction SEM

# Structural Equation Modeling excels at allowing researchers to measure
# relationships between multi-item constructs. *Constructs* are statistical
# representation of concepts that are hard to measure in with a singular metric,
# and are best represented by multiple measurements.

# Each SEM is defined by two models: a **measurement model** that describes how
# each construct is measured using multiple items, and **structural model** that
# describes the structure of causal relationships between the constructs. The
# parameters of an SEM can then be **estimated** and **visualized** by the
# SEMinR package.

#* Measurement Model

library(seminr)

influence_mm <- constructs(
  reflective("PL", multi_items("pl_", 1:4)),
  reflective("PQ", multi_items("pq_", 1:4)),
  reflective("PI", multi_items("pi_", 1:5)))

# Four constructs are defined in this measurement model. Note how the
# constructs are collectively defined within the `constructs()` function. Each
# construct is defined as being reflected in their measurement items using the
# `reflective()` function. And the multiple items reflecting each construct are
# defined by the `multi_items()` function. **The syntax of our SEMinR package
# closely matches the vocabulary that researchers use to describe such models!**

#* Structural Model

influence_sm <- relationships(
  paths(from = c("PL", "PQ"), to = c("PI")))

# Note that we can define a set of relationships at once. In the `paths()`
# function call above, we defines two paths, one from each of `PL` and `PQ` to
# each of `PI`.

#* Data

# Once we have the measurement and structural models of an SEM defined in
# SEMinR, we can proceed to estimate the measurement and structural parameters
# from a sample of data. The data should contain *observations* of each
# measurement item for each case (e.g., survey respondent). The data typically
# resides in a file with a data format such as `.csv` (comma separated
# variables), though there are R packages to load data in other formats such as
# `.sav` (SPSS data), `xlsx` (Excel data sheet), and so on.

influence_data <- read.csv("data/influencer_data_book_final.csv")

#* Estimation

# We can use the data we have loaded to now estimate the parameters of our SEM.
# In this case, we use an estimate technique called *covariance-based SEM*
# (CB-SEM).

influence_model <- estimate_cbsem(
  data = influence_data,
  measurement_model = influence_mm,
  structural_model  = influence_sm)

# The `influence_model` object in which the estimation is stored does not
# contain a full report that researchers would be interested in. Instead,
# researchers will want to ask SEMinR to *summarize* the results cogently for
# interpretation.

influence_summary <- summary(influence_model)

# The `influence_summary` object holds a wealth of other estimated values that
# researchers might wish to inspect or report. For example, researchers applying
# CB-SEM are typically interested in the quality of the estimation, including
# details of how well the SEM model *fits* the data (we show only a part of the
# full fit report below):

influence_summary$quality$fit

influence_summary$quality$reliability

# And also the structural paths that researchers often hypothesize

influence_summary$paths

#* Visualization

# Researchers often find that it is helpful to get a high-level glimpse of
# their model description and results from a visualization.

plot(influence_model)

#* Join us

#** Collaboration and Feedback

#** Social Media

