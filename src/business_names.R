library("ProjectTemplate")
load.project()

biz <- matrix(0, nrow = nrow(licenses), ncol = nrow(business.name.words))

colnames(biz) <- business.name.words[, 1]

for (i in 1:nrow(business.name.words))
{
  biz[, i] <- as.numeric(grepl(business.name.words[i, 1], licenses$Business_Name))
}

write.csv(biz, file = "data/biz.csv", row.names = FALSE)
