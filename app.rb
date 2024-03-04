require "sinatra"
require "sinatra/reloader"

get("/") do
  erb((:home))
end
# get("/blackjack") do
#   erb((:home))
# end
get("/how-to-play") do
  erb((:how_to_play))
end
