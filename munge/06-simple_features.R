feature.names <- c("lotarea",
				   "bldgarea",
				   "comarea",
				   "resarea",
				   "officearea",
				   "retailarea",
				   "garagearea",
				   "strgearea",
				   "factryarea",
				   "yellow_grease_gallons_on_lot",
				   "restaurant_license_on_tax_lot",
				   "liquor_license_on_tax_lot",
				   "restaurant_license_on_tax_lot",
				   "liquor_license_on_tax_lot")

all.features <- cbind(log.licenses[, feature.names], dense.dtm)
