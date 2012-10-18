numeric.variables <- c()

for (j in 1:ncol(licenses))
{
  if (is.numeric(licenses[, j]))
  {
    numeric.variables <- c(numeric.variables, j)
  }
}

non.numeric.variables <- which(!(1:ncol(licenses) %in% numeric.variables))
