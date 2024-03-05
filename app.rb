require "sinatra"
require "sinatra/reloader"
require "http"

get("/") do
  erb(:home, {layout: :layout})
end

get("/blackjack") do
  add_card = "https://deckofcardsapi.com/api/deck/new/draw/?count=2"
  raw_response = HTTP.get(add_card)
  parsed_response = JSON.parse(raw_response)
  @parsed_response = [parsed_response]
  keys = parsed_response.keys
  cards = parsed_response["cards"]
  @card_one_hash = cards.at(0)
  @card_one_value = @card_one_hash["value"]
  @card_one_image = @card_one_hash["image"]
  @card_one_suit = @card_one_hash["suit"]

  @card_two_hash = cards.at(1)
  @card_two_value = @card_two_hash["value"]
  @card_two_image = @card_two_hash["image"]
  @card_two_suit = @card_two_hash["suit"]
  # def stand()
  #   hold = 
  #   return hold
  # end
  erb(:blackjack, {layout: :layout})
end

get("/how-to-play") do
  erb(:how_to_play, {layout: :layout})

end
