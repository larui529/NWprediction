#to extract a df from three source and write it out

us_twitter = readLines("./final/en_US/en_US.twitter.txt", encoding = "UTF-8")
us_blog = readLines("./final/en_US/en_US.blogs.txt", encoding = "UTF-8")
us_news = readLines("./final/en_US/en_US.news.txt", encoding = "UTF-8")

df1 <- c(sample(us_twitter, length(us_twitter)*0.1),sample(us_blog, length(us_blog)*0.1),sample(us_news, length(us_news)*0.1))

remove.all <- function (string) {
        string = str_replace_all(string, "[[:punct:]]", "")
        string = str_replace_all(string, "[[:digit:]]", "")
        string = tolower(string)
        return(string)
}

df1 <- remove.all(df1)

fileConn <- ("df.txt")
writeLines(df1, fileConn)
close(fileConn)