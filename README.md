#Steam Friend Thingy
A single-page Ruby/Sinatra application that retrieves statistics on your Steam friends and compares them against your own statistics. Data comes from Steam via the [Steam Condenser](https://github.com/koraktor/steam-condenser-ruby) gem. 

[Steam Friend Thingy](https://steam-friend-thingy.herokuapp.com/)
Note that you sometimes have to submit 2-3 times before it works due to some issues with Heroku. Will fix this as soon as possible.

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
