#displays the decks
get '/' do
  @decks = Deck.all
  @cards = Card.all
  erb :index
end

get '/new' do
  erb :new_deck
end

post '/new' do


  if params.values.any?{ |val| val.blank?}
    @error_message = "fill out your fucking forms pretty please"
    redirect '/new'

  else

    category = Deck.create(category: params[:category])
    question1 = Card.new(question: params[:question_1], answer: params[:answer_1])
    question1.deck = category
    question1.save
    question2 = Card.new(question: params[:question_2], answer: params[:answer_2])
    question2.deck = category
    question2.save
    question3 = Card.new(question: params[:question_3], answer: params[:answer_3])
    question3.deck = category
    question3.save
    question4 = Card.new(question: params[:question_4], answer: params[:answer_4])
    question4.deck = category
    question4.save
    redirect '/'
  end
end


#takes you to deck by id ex 'fruits',
#shows all the cards for a specific deck

get '/deck/:id' do

  unless params[:id].nil?

    session[:current_deck_id] = params[:id]

    current_deck = Deck.find(params[:id])

    session[:cards_left_in_deck] = []

    Deck.find( params[:id] ).cards.each {
      |card|
      session[:cards_left_in_deck] << card.id
    }
  end

  session[:current_card_id] = session[:cards_left_in_deck].sample

  raise "session current card is nil, o craps." if session[:current_card_id].nil?

  erb :show_deck

end

post "/answer" do
  answer = params[:user_answer]
  puts "**********************"
  current_card =  Card.find(session[:current_card_id])
  puts "**********************"
    puts "Answer: #{answer}"
    puts "current_card.answer: #{current_card.answer}"
    p answer == current_card.answer
  if answer == current_card.answer
    session[:current_card_answered?] = true
  else
    session[:current_card_answered?] = false
  end

  if session[:current_card_answered?]
    puts "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
    session[:current_card_id] = session[:cards_left_in_deck].sample
    session[:current_card_answered?] = false
  end

  redirect "/deck/#{session[:current_deck_id]}"
end











# get '/deck/:id' do


#  #  unless params[:id].nil? do
#  #    session[:current_deck] = Deck.find(params[:id])
#  #    puts "****************************"
#  #    p session[:current_deck]
#  #    puts "****************************"
#  #    session[:cards_left_in_deck] = []
#  #    Deck.find( params[:id] ).each {|i|
#  #    session[:current_deck].push i  }
#  #  end
#  # end



#  #   session[:cards_left_in_deck] = session[:current_deck].cards.clone
#  #   session[:current_card] = session[:cards_left_in_deck].pop

#  #   erb :show_deck

#   unless params[:id].nil?

#     session[:current_deck_id] = params[:id]

#     current_deck = Deck.find(params[:id])

#     session[:cards_left_in_deck] = []

#     Deck.find( params[:id] ).cards.each {
#       |card|
#       session[:cards_left_in_deck] << card.id
#     }
#   end

#   session[:current_card_id] = session[:cards_left_in_deck].sample

#   raise "session current card is nil, o craps." if session[:current_card_id].nil?

#   erb :show_deck

# # >>>>>>> 7e03eb3fc165b6b45e660cf1bb5af84639676efc
# # end

# # post "/answer" do
# #   answer = params[:user_answer]
# # <<<<<<< HEAD

# #   if answer == session[:current_card].answer

# #   puts "**********************"
# #   current_card =  Card.find(session[:current_card_id])
# #   puts "**********************"
# #     puts "Answer: #{answer}"
# #     puts "current_card.answer: #{current_card.answer}"
# #     p answer == current_card.answer
# #   # if answer == current_card.answer
# # >>>>>>> 7e03eb3fc165b6b45e660cf1bb5af84639676efc
# #     session[:current_card_answered?] = true
# #   else
# #     session[:current_card_answered?] = false
# #   end

# # <<<<<<< HEAD
#   session[:current_card] = session[:cards_left_in_deck].pop if session[:current_card_answered?]

#   redirect '/deck'
# # =======
#   if session[:current_card_answered?]
#     puts "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
#     session[:current_card_id] = session[:cards_left_in_deck].sample
#     session[:current_card_answered?] = false
#   end

#   redirect "/deck/#{session[:current_deck_id]}"
# >>>>>>> 7e03eb3fc165b6b45e660cf1bb5af84639676efc
# end
