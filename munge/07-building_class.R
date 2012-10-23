licenses <- transform(licenses,
                      bldgCategory = unlist(lapply(strsplit(licenses$bldgclass, ""), function (l) {paste(unlist(l)[1], collapse = "")})))
