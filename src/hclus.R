# File-Name:       hclus.R
# Date:            2012-10-23
# Author:          Drew Conway
# Email:           drew.conway@nyu.edu                                      
# Purpose:         Perform a hierarchical clustering of NYC liscense data
# Data Used:       ../data/licenses.csv
# Packages Used:   base
# Machine:         Drew Conway's MacBook Pro

# Copyright (c) 2012, under the Simplified BSD License.  
# For more information on FreeBSD see: http://www.opensource.org/licenses/bsd-license.php
# All rights reserved.

setwd("../")    # Only required if you are running code directly from this file

library("ProjectTemplate")
load.project()

# Dissimilarty measures

# dissimilarityMatrix <- function(m1,m2) {
#     dissimilarity.list <- list()
#     for(i in 1:nrow(log.licenses)) {
#         dissimilarity.list[[i]] <- sapply(1:nrow(log.licenses), 
#         function(j) { 
#             return(sqrt((log.licenses[i,m1] - log.licenses[j,m2])**2))
#         })
#     }
#     return(do.call(rbind, dissimilarity.list))
# }
# 
# ## Attempt 1: Root-squared difference in residential area and commericial area

# Need to take a random sample rows because (hot damn!) 
num.rows <- 5000
row.sample <- sample(1:nrow(log.licenses), num.rows)

# Take the sample
license.sample <- log.licenses[row.sample,]

resarea.comarea <- dist(cbind(license.sample$comarea, license.sample$resarea), method="euclidian")
rc.hc <- hclust(resarea.comarea)

for(i in 3:12) {
    license.sample[,paste("CUT", i, sep=".")] <- cutree(rc.hc, i)
}

rc.plot <- ggplot(license.sample, aes(x=x, y=y))+geom_point(aes(color=as.factor(CUT.5), size=0.01, alpha=0.25)) +
    facet_wrap(~factor(CUT.5)) +
    scale_color_brewer(type="qual", palette="Dark2", name="Cluster Partition") + 
    scale_size(limits=c(0,1), guide="none") + 
    scale_alpha(guide="none")

## Attempt 2: full feature set dissimilarites

full.feature <- log.licenses[1:2500,]

full.hc <- hclust(as.dist(dissimilarity))

for(i in 3:12) {
    full.feature[,paste("CUT", i, sep=".")] <- cutree(full.hc, i)
}

full.plot <- ggplot(full.feature, aes(x=x, y=y))+geom_point(aes(color=as.factor(CUT.5))) +
    scale_color_brewer(type="qual", palette="Dark2")
    
    
## Attempt 3: using business names

# business.sample <- business.names[row.sample,]
# 
# business.hc <- hclust(dist(business.sample))
# 
# for(i in 3:12) {
#     business.sample[,paste("CUT", i, sep=".")] <- cutree(business.hc, i)
# }
