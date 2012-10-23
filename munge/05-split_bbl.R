# Split BBL into Borough, Block, Lot

# * `bbl`: Numeric code incidating "borough-block lot".
# * First digit is borough.
# * Five digits are block.
# * Four digits are lot.

licenses <- transform(licenses,
                      bblBorough = unlist(lapply(strsplit(licenses$bbl, ""), function (l) {paste(unlist(l)[1], collapse = "")})))
licenses <- transform(licenses,
                      bblBlock = unlist(lapply(strsplit(licenses$bbl, ""), function (l) {paste(unlist(l)[2:6], collapse = "")})))
licenses <- transform(licenses,
                      bblLot = unlist(lapply(strsplit(licenses$bbl, ""), function (l) {paste(unlist(l)[7:10], collapse = "")})))
