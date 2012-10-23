lic <- read.csv('clean_licenses.csv', stringsAsFactors=FALSE)
n <- data.frame(Business_Name = unique(lic$Business_Name))
rownames(n) <- n$Business_Name
n$Business_Name <- NULL
ecd <- unique(lic$Entity_Code_Description)
runningsum <- 0;
for (d in ecd) {
	n[[d]] <- c(0);
	cond <- rownames(n) %in% lic$Business_Name[lic$Entity_Code_Description == d];
	runningsum <- runningsum + sum(cond);
	n[[d]][cond] <- 1;
}
n$liclist <- c("")
cn <- colnames(n)[1:53]
# takes about 20 minutes; perhaps should be redone with lapply
for (i in c(1:length(rownames(n)))) {
	n$liclist[i] <- paste(cn[n[i,c(1:53)] > 0], collapse=" + ");
}
license_combination_counts <- table(n$liclist)
write.csv(license_combination_counts, "license_combination_counts.csv")
