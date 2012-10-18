log.licenses <- licenses

for (j in 1:9) # Leave other numeric.variables alone
{
  log.licenses[, j] <- log1p(licenses[, j])
}
