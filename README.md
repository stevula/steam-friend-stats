#Steam Friend Thingy
A single-page Ruby/Sinatra application that retrieves statistics on your Steam friends and compares them against your own statistics. Data comes from Steam via the [Steam Condenser](https://github.com/koraktor/steam-condenser-ruby) gem. 

**There's a problem with the Heroku branch where it will time out. May have to resubmit 1-2 times. Will fix this as soon as possible.**
[Steam Friend Thingy](https://steam-friend-thingy.herokuapp.com/)


##Implemented Goals
* Most friends
* Most played game in last 2 weeks
* Most games
* Oldest Steam member
* Newest Steam member

##Goals Deemed Impractical Due to API Limitations
* Most played game of all time - *only provides hours of games played in last 2 weeks.*
* Most total playtime - *only provides hours of games played in last 2 weeks.*
* Most achievements - *only provides player achievement stats for specific games*
