# Overall Goal
* Want to cluster businesses. Some approaches:
  * k-means
  * dp-means
  * Hierarchical clustering
  * Clustering in space defined by classifier for existing categories
* Need to set up a cross-validation strategy for comparing results
  * Should satisfy human intuition as well as held-out performance metrics

# Planned Approaches
* Try to get approximate (lat, long) pairs using (x, y) data
  * Get matching data for sample businesses
  * Find linear mapping between (lat, long) and (x, y) using `lm()`
* Deal with quirky text elements like `\xa0OFFICE`
* Produce new features from text data in `bldgdesc` field
* Need to cope with occasional missing data in fields:
  * `any(is.na(licenses[, 13]))`
  * `any(is.na(licenses[, 14]))`
  * `any(is.na(licenses[, 16]))`
  * `any(is.na(licenses[, 19]))`
