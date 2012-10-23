# Remove non-ASCII characters
licenses <- transform(licenses, bldgdesc = str_replace(bldgdesc, "\xa0", ""))
licenses <- transform(licenses, bldgdesc = str_replace(bldgdesc, "\U3e30613c", ""))
#licenses <- transform(licenses, bldgdesc = str_replace(bldgdesc, "\\U3e30613c", ""))

# Remove punctuation
licenses <- transform(licenses, bldgdesc = removePunctuation(licenses$bldgdesc))

write.csv(licenses, file = "clean_licenses.csv", row.names = FALSE)
write.csv(log.licenses, file = "log_licenses.csv", row.names = FALSE)
