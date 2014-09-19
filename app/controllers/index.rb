#displays the decks
get '/' do
  @decks = Deck.all
  @cards = Card.all
  erb :index
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

  session[:current_card_id] = session[:cards_left_in_deck].pop

  raise "session current card is nil, o craps." if session[:current_card_id].nil?

  erb :show_deck

end

post "/answer" do
  answer = params[:user_answer]
  puts "**********************"
  current_card =  Card.find(session[:current_card_id])
  puts "**********************"
  if answer == current_card.answer
    session[:current_card_answered?] = true
  else
    session[:current_card_answered?] = false
  end

  if session[:current_card_answered?]
    current_card = session[:cards_left_in_deck].pop
    session[:current_card_answered] = false
  end

  redirect "/deck/#{session[:current_deck_id]}"
end
