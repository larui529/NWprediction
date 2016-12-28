library(tm)
library(dplyr)
library(ggplot2)
library(pryr)
library(stringr)
library(RWeka)


df1 <- readLines("df.txt")

extract.word.fun <- function (string, num.gram = 3) {
        sep.chr = tail(strsplit(string, split = " ")[[1]], num.gram)
        string = paste(sep.chr, sep = "", collapse = " ")
        string = str_replace_all(string, "[[:punct:]]", "")
        string = str_replace_all(string, "[[:digit:]]", "")
        string = tolower(string)
        return(string)
}

next.word.sum = function(datasource, term) {
        match = NULL
        matchlist = NULL
        match = regmatches(datasource, regexpr(paste(term, "(.*?) "), datasource))
        matchlist = gsub(paste(term, "| $"),"", match)
        matchlist = matchlist[matchlist != ""]
        return(matchlist)
}
#pred.nwd.model predict next word based on previous terms. string.typed is the string
#typed into the textinput. datasource is which datasource you want to use(e.g df1, us_blog
#num.gram is the number of gram you want to extract in textinput, 
#num. shown shows how many word to predict
pred.nwd.model <- function (string.typed, datasource = df1, num.gram = 3, num.shown = 10) {
        extracted.word <- extract.word.fun(string.typed, num.gram)
        next.word <- next.word.sum(datasource, extracted.word)
        nwText = vector()
        nwCount = vector()
        for(i in 1:num.shown) {
                if (is.na(sort(table(next.word), decreasing = TRUE)[i])) {
                        break
                }
                else {
                        nwText[i] = names(sort(table(next.word), decreasing = TRUE)[i])
                }
                nwCount[i] = as.numeric(sort(table(next.word), decreasing = TRUE)[i])
        }
        pred.num.3 <- length(nwCount)
        if(length(nwCount) < 10) {
                extracted.word <- extract.word.fun(extracted.word, 2)
                next.word <- next.word.sum(datasource, extracted.word)
                for(i in 1:(num.shown - pred.num.3)) {
                        if (is.na(sort(table(next.word), decreasing = TRUE)[i])) {
                                break
                        }
                        else {
                                nwText[pred.num.3+i] = 
                                        names(sort(table(next.word), 
                                                   decreasing = TRUE)[i])
                        }
                        nwCount[pred.num.3+i] = 
                                as.numeric(sort(table(next.word), 
                                                decreasing = TRUE)[i])
                }
       }
        pred.word.list <- data.frame(nw = nwText, counts = nwCount)
        return(pred.word.list)
}

word.Pred <- c("Choice 1" = "1",
               "Choice 2" = "2",
               "Choice 3" = "3",
               "Choice 4" = "4",
               "Choice 5" = "5",
               "Choice 6" = "6",
               "Choice 7" = "7"
)
