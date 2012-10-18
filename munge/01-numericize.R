# First nine columns should be numeric.
library("stringr")
for (j in 1:9)
{
  licenses[, j] <- as.numeric(str_replace(licenses[, j], ",", ""))	
}

licenses <- transform(licenses,
                      yellow_grease_gallons_on_lot =
                       str_replace(yellow_grease_gallons_on_lot, ",", ""))
licenses <- transform(licenses,
                      yellow_grease_gallons_on_lot =
                       ifelse(yellow_grease_gallons_on_lot == "",
                              "0",
                              yellow_grease_gallons_on_lot))
licenses <- transform(licenses,
                      yellow_grease_gallons_on_lot =
                       as.numeric(yellow_grease_gallons_on_lot))
