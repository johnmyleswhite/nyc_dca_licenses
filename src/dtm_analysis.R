library("ProjectTemplate")
load.project()

library("tm")

# TODO: Clean up text more to deal with odd (non-ASCII) characters
licenses <- transform(licenses, bldgdesc = str_replace(bldgdesc, "\xa0", ""))
licenses <- transform(licenses, bldgdesc = str_replace(bldgdesc, "\U3e30613c", ""))

tm.corpus <- Corpus(VectorSource(licenses$bldgdesc))

# Perhaps do some text preprocessing here

dtm <- DocumentTermMatrix(tm.corpus)

# Lots of simple, easy terms to work with
colnames(dtm)

dense.dtm <- as.matrix(dtm)

##############################################################################
#
# Example Usage: Latent Semantic Analysis
#
##############################################################################

# Throw out rare terms
dense.dtm <- dense.dtm[, which(colSums(dense.dtm) > 10)]

# PCA fails
#text.pca <- princomp(dense.dtm)
# Seems like two columns may be nearly perfectly correlated

# Use SVD instead to achive LSA effects

# Replace raw counts with binary counts
# Not really sufficient in such short document
# TODO: Try TF-IDF
dense.dtm <- ifelse(dense.dtm >= 1, 1, 0)

text.svd <- svd(dense.dtm)

# Plot results
plot(text.svd$u[, 1:2])

library("rgl")
plot3d(text.svd$u[, 1:3])
