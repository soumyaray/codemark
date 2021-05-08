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

# We can define the structural model of an SEM by specifying the
# *relationships* between the constructs — specifically, the causal paths *from*
# each construct *to* other constructs.

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

influence_summary$quality$fit$curated$ordinary

# These fit metrics should be familiar to CB-SEM practitioners. The summary
# object can also be inspect for the estimated parameters of interest, such as
# the measurement quality:

influence_summary$quality$reliability

# And also the structural paths that researchers often hypothesize

influence_summary$paths

#* Visualization

# Researchers often find that it is helpful to get a high-level glimpse of
# their model description and results from a visualization.

#* Join us

#** Collaboration and Feedback

#** Social Media

