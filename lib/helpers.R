# Hand in data set with categories appended as a column
# Specify column name
# Will spit out example businesses for each category

show_examples <- function(new.licenses, category.label)
{
  labels <- sort(unique(new.licenses[, category.label]))
  for (label in labels)
  {
    cat("\n")
    cat(paste(" -- Category", label))
    cat("\n")
    cat("\n")
    cat(paste(new.licenses$Entity_Code_Description[new.licenses[, category.label] == label][1:5], collapse = "\n"))
    cat("\n")
  }
}

#show_examples(log.licenses, "cluster")
