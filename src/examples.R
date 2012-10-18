library("ProjectTemplate")
load.project()

##############################################################################
#
# k-Means
#
##############################################################################

# kmeans(licenses[, numeric.variables], 2)
# names(licenses)[c(13, 14, 16, 19)] cause NA problems

kmeans(log.licenses[, 1:9], 2)
kmeans(log.licenses[, 1:9], 3)
#...
kmeans(log.licenses[, 1:9], 10)

##############################################################################
#
# PCA, then k-Means
#
##############################################################################

# Work in linear space
pca <- princomp(licenses[, 1:9])

summary(pca) # Suggests 3 components may be enough in linear space

plot(pca$scores[, 1:2])
plot(pca$scores[, 2:3])

# Work in log space
pca <- princomp(log.licenses[, 1:9])

summary(pca) # Suggests 3 components are not really enough

plot(pca$scores[, 1:2])
plot(pca$scores[, 2:3])
plot(pca$scores[, 3:4])
plot(pca$scores[, 4:5])

library("rgl")
plot3d(pca$scores[, 1:3])
plot3d(pca$scores[, 4:6])
plot3d(pca$scores[, 7:9])

plot(pca$scores[, 1:2], col = kmeans(log1p(licenses[, 1:9]), 4)$cluster)
plot(pca$scores[, 2:3], col = kmeans(log1p(licenses[, 1:9]), 4)$cluster)
plot(pca$scores[, 3:4], col = kmeans(log1p(licenses[, 1:9]), 4)$cluster)
plot(pca$scores[, 4:5], col = kmeans(log1p(licenses[, 1:9]), 4)$cluster)

plot(pca$scores[, 1:2], col = as.numeric(factor(licenses$bldgclass)))
plot(pca$scores[, 2:3], col = as.numeric(factor(licenses$bldgclass)))

# Work with additional variables.
pca <- princomp(log.licenses[, c(1:9, 11, 37:38)])

summary(pca)

plot(pca$scores[, 1:2])
plot(pca$scores[, 2:3])

plot(pca$scores[, 1:2], col = kmeans(log.licenses[, c(1:9, 11, 37:38)], 5)$cluster)

plot3d(pca$scores[, 1:3], col = kmeans(log.licenses[, c(1:9, 11, 37:38)], 5)$cluster)
