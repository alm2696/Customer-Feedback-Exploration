# Load necessary library
library(ggplot2)

# Read the data
survey_data <- read.csv("C:\\Users\\angel\\Downloads\\HelpdeskSurvey.csv")

# Generate the contingency table for Survey Response and Overall Satisfaction
contingency_table <- table(survey_data$Survey.Response, survey_data$Overall.Satisfaction)

# Add row-wise and column-wise totals
contingency_table_with_totals <- addmargins(contingency_table)

# Print the contingency table with totals
print(contingency_table_with_totals)

# Plot bar charts for row-wise and column-wise totals
# Row-wise totals
row_totals <- margin.table(contingency_table, 1)
barplot(row_totals, main="Row Totals (Survey Response)", col="blue", xlab="Survey Response", ylab="Total Count")

# Column-wise totals
col_totals <- margin.table(contingency_table, 2)
barplot(col_totals, main="Column Totals (Overall Satisfaction)", col="green", xlab="Overall Satisfaction", ylab="Total Count")

# Answer the specific questions
# a) How many customers responded with 'Somewhat Satisfied' response and indicated 4 as level of overall satisfaction?
somewhat_satisfied_4 <- contingency_table["Somewhat Satisfied", "4"]
cat("Somewhat Satisfied and level 4:", somewhat_satisfied_4, "\n")

# b) How many customers responded with 'Very Satisfied' response and indicated 5 as level of overall satisfaction?
very_satisfied_5 <- contingency_table["Very Satisfied", "5"]
cat("Very Satisfied and level 5:", very_satisfied_5, "\n")

# c) How many customers rated overall satisfaction as 3?
overall_satisfaction_3 <- col_totals["3"]
cat("Rated overall satisfaction as 3:", overall_satisfaction_3, "\n")

# d) How many customers seem to be 'Dissatisfied'?
dissatisfied <- contingency_table["Dissatisfied",]
cat("Dissatisfied customers:", sum(dissatisfied), "\n")
