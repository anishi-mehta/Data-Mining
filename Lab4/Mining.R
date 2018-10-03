library(package = "arules")
transactions = read.transactions(file = file("stdin"), format = "basket", sep = ",")
rules = apriori(transactions, parameter = list(minlen=1, sup = 0.001, conf = 0.001))
itemsets <- unique(generatingItemsets(rules))
itemsets.df <- as(itemsets, "data.frame")
frequentItemsets <- itemsets.df[with(itemsets.df, order(-support,items)),]
names(frequentItemsets)[1] <- "itemset"
write.table(frequentItemsets, file = "", sep = ",", row.names = FALSE)
