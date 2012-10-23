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

setwd("../")    # Only required of you are running code directly from this file

library("ProjectTemplate")
load.project()

# Dissimilarty measures

dissimilarityMatrix <- function(m1,m2) {
    dissimilarity.list <- list()
    for(i in 1:nrow(log.licenses)) {
        dissimilarity.list[[i]] <- sapply(1:nrow(log.licenses), 
        function(j) { 
            return(sqrt((log.licenses[i,m1] - log.licenses[j,m2])**2))
        })
    }
    return(do.call(rbind, dissimilarity.list))
}

## Attempt 1: Root-squared difference in residential area and commericial area

resarea.comarea <- dist(cbind(log.licenses$comarea, log.licenses$resarea), method="euclidian")