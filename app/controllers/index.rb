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
    session[:current_deck] = Deck.find(params[:id])
    session[:cards_left_in_deck] = []
    Deck.find( params[:id] ).cards.each {
      |i|
      session[:cards_left_in_deck].id.push i
    }
  end

  session[:current_card] = session[:cards_left_in_deck].pop
 puts "**********************"
  p session[:current_card]
  puts "**********************"
  raise "session current card is nil, o craps." if session[:current_card].nil?

  erb :show_deck

end

post "/answer" do
  answer = params[:user_answer]
  puts "**********************"
  p session[:current_card]
  puts "**********************"
  if answer == session[:current_card].answer
    session[:current_card_answered?] = true
  else
    session[:current_card_answered?] = false
  end

  if session[:current_card_answered?]
    session[:current_card] = session[:cards_left_in_deck].pop
    session[:current_card_answered] = false
  end

  redirect '/deck'
end
