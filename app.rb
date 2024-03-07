require "sinatra"
require "sinatra/reloader"
require "http"

get("/") do
  @num = 1
  @pile = []
  def add_pile
    6.times do |i|
      if @num < 25
      @num += 4
      @pile.push(@num)
      end
    end
  end
  add_pile()
  @me = 0 + @pile[0]
  # @pile.delete_at(0)
  @updated_array = @pile.drop(1)
  # @updated_num = @pile
  @me_two = @me + @updated_array[0]
  @updated_array2 = @updated_array.drop(1)

  @me_three = @me_two + @updated_array2[0]
  @updated_array3 = @updated_array2.drop(1)

  @me_four = @me_three + @updated_array3[0]
  @updated_array4 = @updated_array3.drop(1)
  
  @me_five = @me_four + @updated_array4[0]
  @updated_array5 = @updated_array4.drop(1)

  @me_six = @me_five + @updated_array5[0]
  @updated_array6 = @updated_array5.drop(1)

  @first_sum = @me + @me_two
  erb(:home, {layout: :layout})
end

get("/blackjack") do
  add_card = "https://deckofcardsapi.com/api/deck/new/draw/?count=6"
  raw_response = HTTP.get(add_card)
  parsed_response = JSON.parse(raw_response)
  @parsed_response = [parsed_response]
  keys = parsed_response.keys
  cards = parsed_response["cards"]
  face_cards = ["KING", "QUEEN", "JACK"]
  # 
  # First card
  # 
  @card_one_hash = cards.at(0)
  @card_one_value = @card_one_hash["value"]
  @card_one_image = @card_one_hash["image"]
  # 
  # Second card
  # 
  @card_two_hash = cards.at(1)
  @card_two_value = @card_two_hash["value"]
  @card_two_image = @card_two_hash["image"]

  @card_three_hash = cards.at(2)
  @card_three_value = @card_three_hash["value"]
  @card_three_image = @card_three_hash["image"]

  @card_four_hash = cards.at(3)
  @card_four_value = @card_four_hash["value"]
  @card_four_image = @card_four_hash["image"]

  @card_five_hash = cards.at(4)
  @card_five_value = @card_five_hash["value"]
  @card_five_image = @card_five_hash["image"]

  @card_six_hash = cards.at(5)
  @card_six_value = @card_six_hash["value"]
  @card_six_image = @card_six_hash["image"]

  

  #Works
  # 
  if face_cards.include?(@card_one_value)
    @card_one_value = 10
  elsif @card_one_value == "ACE"
    @card_one_value = 11
  end

  if face_cards.include?(@card_two_value)
    @card_two_value = 10
  elsif @card_two_value == "ACE"
    @card_two_value = 11
  end
  if face_cards.include?(@card_three_value)
    @card_three_value = 10
  elsif @card_three_value == "ACE"
    @card_three_value = 11
  end
  if face_cards.include?(@card_four_value)
    @card_four_value = 10
  elsif @card_four_value == "ACE"
    @card_four_value = 11
  end
  if face_cards.include?(@card_five_value)
    @card_five_value = 10
  elsif @card_five_value == "ACE"
    @card_five_value = 11
  end
  if face_cards.include?(@card_six_value)
    @card_six_value = 10
  elsif @card_six_value == "ACE"
    @card_six_value = 11
  end

  # Proto
  # 

  # def is_face_card(card)
  #   face_card = ["KING", "QUEEN", "JACK"]
  #   if face_card.include?(card)
  #     card = 10
  #   elsif card == "ACE"
  #     card = 11
  #   end
  # end

  # is_face_card(@card_one_value)
  # is_face_card(@card_two_value)
  # is_face_card(@card_three_value)
  # is_face_card(@card_four_value)
  # is_face_card(@card_five_value)
  # is_face_card(@card_six_value)

  # Not working properly
  # if @card_one_value && @card_two_value == 11
  #   @card_one_value = 11
  #   @card_two_value = 1
  # end

  
  @startingHand = @card_one_value.to_i + @card_two_value.to_i


  # def stand()
  #   hold = 
  #   return hold
  # end
  erb(:blackjack, {layout: :layout})
end

get("/how-to-play") do
  erb(:how_to_play, {layout: :layout})

end
