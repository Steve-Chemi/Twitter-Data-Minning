#Exercice 1.3

#Download tweets with rtweets lib

library(rtweet)
?search_tweets

##################################################
query = "covid-19"
number.of.tweets = 10
#################################################

#1. a data.frame AB.df that contains 19 unique tweets.

a.df <- search_tweets(
  query,
  n = number.of.tweets,
  type = "recent",
  include_rts = FALSE, #No retweets, only original tweets!
  geocode = NULL,
  max_id = NULL,
  parse = TRUE,
  token = NULL,
  retryonratelimit = FALSE,
  verbose = TRUE,
  lang = "en",
  tweet_mode = "extended" # get 240 character tweets in full
)

max_id = tail(a.df$status_id,1)

b.df <- search_tweets(
  query,
  n = number.of.tweets,
  type = "recent",
  include_rts = FALSE, #No retweets, only original tweets!
  geocode = NULL,
  max_id = max_id,
  parse = TRUE,
  token = NULL,
  retryonratelimit = FALSE,
  verbose = TRUE,
  lang = "en",
  tweet_mode = "extended" # get 240 character tweets in full
)
b.df = b.df[-1,]
AB = rbind(a.df,b.df)  
rm(a.df); rm(b.df)
#Done!


#################################################

query = "covid-19"
number.of.tweets = 10

################################################################
#2. for loop to fill 91 Values

for(i in 1:10){
  if(i == 1){
    a <- search_tweets(
      query,
      n = number.of.tweets,
      type = "recent",
      include_rts = FALSE, #No retweets, only original tweets!
      geocode = NULL,
      max_id = NULL,
      parse = TRUE,
      token = NULL,
      retryonratelimit = FALSE,
      verbose = TRUE,
      lang = "en",
      tweet_mode = "extended" # get 240 character tweets in full
    )
  }
  else{
    max_id = tail(a$status_id,1)
    
    b <- search_tweets(
      query,
      n = number.of.tweets,
      type = "recent",
      include_rts = FALSE, #No retweets, only original tweets!
      geocode = NULL,
      max_id = max_id,
      parse = TRUE,
      token = NULL,
      retryonratelimit = FALSE,
      verbose = TRUE,
      lang = "en",
      tweet_mode = "extended" # get 240 character tweets in full
    )
    b = b[-1,];
    a = rbind(a,b);rm(b)
  }
  
}
rm(i)
rm(max_id)


#################################################

query = "covid-19"
number.of.tweets = 18000

################################################################
#2. Adapting the loop for collecting 3*18k lines

for(i in 1:3){
  if(i == 1){
    a <- search_tweets(
      query,
      n = number.of.tweets,
      type = "recent",
      include_rts = FALSE, #No retweets, only original tweets!
      geocode = NULL,
      max_id = NULL,
      parse = TRUE,
      token = NULL,
      retryonratelimit = FALSE,
      verbose = TRUE,
      lang = "fr",
      tweet_mode = "extended" # get 240 character tweets in full
    )
  }
  else{
    Sys.sleep(900)                #delay for download!
    max_id = tail(a$status_id,1)
    
    b <- search_tweets(
      query,
      n = number.of.tweets,
      type = "recent",
      include_rts = FALSE, #No retweets, only original tweets!
      geocode = NULL,
      max_id = max_id,
      parse = TRUE,
      token = NULL,
      retryonratelimit = FALSE,
      verbose = TRUE,
      lang = "fr",
      tweet_mode = "extended" # get 240 character tweets in full
    )
    b = b[-1,];
    a = rbind(a,b);rm(b)
  }
  
}

#By Steve CHEMI NGOULOU

save(tweets.df,"C:\\Users\\steve\\Downloads\\Mytweets.csv", row.names = TRUE)
