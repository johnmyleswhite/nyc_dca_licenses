library("ProjectTemplate")
load.project()

ggplot(licenses, aes(x = x, y = y)) + geom_point()

ggplot(licenses, aes(x = x, y = y, color = Entity_Type)) + geom_point()

ggplot(licenses, aes(x = x, y = y, color = Premise_Zip_Code)) + geom_point()

ggplot(log.licenses, aes(x = lotarea)) + geom_histogram()
ggplot(log.licenses, aes(x = bldgarea)) + geom_histogram()
ggplot(log.licenses, aes(x = comarea)) + geom_histogram()
ggplot(log.licenses, aes(x = resarea)) + geom_histogram()
ggplot(log.licenses, aes(x = officearea)) + geom_histogram()
ggplot(log.licenses, aes(x = retailarea)) + geom_histogram()
ggplot(log.licenses, aes(x = garagearea)) + geom_histogram()
ggplot(log.licenses, aes(x = strgearea)) + geom_histogram()
ggplot(log.licenses, aes(x = factryarea)) + geom_histogram()

ggplot(licenses, aes(x = bbl, y = blockface)) + geom_point()

color.licenses <- licenses
color.licenses <- subset(color.licenses, !is.na(x) & !is.na(y))
color.licenses <- transform(color.licenses, Cluster = kmeans(color.licenses[, c("x", "y")], 5)$cluster)
ggplot(color.licenses, aes(x = x, y = y, color = factor(Cluster))) + geom_point() + theme(legend.position = "none")
ggsave("color_licenses.pdf")
