


##Análisis bibliometrico

library(bibliometrix)
install.packages("readr")
library(readr)

file.choose()

file <- ("D:\\Project A+\\Hidrolizados\\Bibliometrico\\ENZIMATIC.bib")
typeof(file)
M <- convert2df(file, dbsource = "scopus", format = "bibtex")
M
results <- biblioAnalysis(M, sep = ",")
typeof(results)
S <- summary(object = "results", k = 15, pause = FALSE)
S
summary(results)

plot(x = results)

NetMatrix <- biblioNetwork(M, analysis = "collaboration", network = "authors", sep = ",")

net=networkPlot(NetMatrix, n = 30, Title = "Co-Citation Network", type = "fruchterman", size=T, remove.multiple=FALSE, labelsize=0.7,edgesize = 5)


N <- metaTagExtraction(M, Field="AU_CO", sep=",")

NetMatrix <- biblioNetwork(N, analysis="collaboration", network="countries", sep=",")

net=networkPlot(NetMatrix, n = dim(NetMatrix)[1], Title = "Country Collaboration", type = "circle", size=TRUE, remove.multiple=FALSE,labelsize=0.8)

M <- metaTagExtraction(M, Field = "AU_CO", sep = ";")
NetMatrix <- biblioNetwork(M, analysis = "collaboration", network = "countries", sep = ";")
# Plot the network
net=networkPlot(NetMatrix, n = dim(NetMatrix)[1], Title = "Country Collaboration", type = "circle",
                size=TRUE, remove.multiple=FALSE,labelsize=0.8)

# Plot Bibliographic Network
options(width = 100)
S <- summary(object = results, k = 10, pause = FALSE)
NetMatrix <- biblioNetwork(M, analysis = "co-occurrences", network = "author_keywords", sep = ";")
S <- normalizeSimilarity(NetMatrix, type = "association")
net <- networkPlot(S, n = 200, Title = "co-occurrence network", type = "fruchterman", 
                   labelsize = 0.7, halo = FALSE, cluster = "walktrap",
                   remove.isolates = FALSE, remove.multiple = FALSE, noloops = TRUE, weighted = TRUE)

# Plot Thematic Map
res <- thematicMap(net, NetMatrix, S)
str(M)
plot(res$map)


# Collaboration networks (universities)
NetMatrix <- biblioNetwork(M, analysis = "collaboration", network = "universities", sep = ";")

# Plot the network
net = networkPlot(NetMatrix, n = 30, 
                  Title = "Collaboration Network universities", type = "auto", 
                  size=T, remove.multiple=TRUE, labelsize=0.9,edgesize = 2)

M = metaTagExtraction(M, "CR_SO", sep=";")
NetMatrix <- biblioNetwork(M, analysis = "co-citation", network = "sources", sep = ";")

# Plot the network
net = networkPlot(NetMatrix, n = 50, 
                  Title = "Journals'Co-Citation Network", type = "auto", 
                  size.cex=TRUE, size=15, remove.multiple=FALSE, labelsize=0.7, edgesize = 8, edges.min=5)


