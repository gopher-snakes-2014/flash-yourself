#displays the decks
get '/' do
  @decks = Deck.all
  @cards = Card.all
  erb :index
end

#takes you to deck by id ex 'fruits',
#shows all the cards for a specific deck

get '/deck/:id' do

  unless params[:id].nil? do
    session[:current_deck] = Deck.find(params[:id])
    puts "****************************"
    p session[:current_deck]
    puts "****************************"
    session[:cards_left_in_deck] = []
    Deck.find( params[:id] ).each {|i|
    session[:current_deck].push i  }
  end
 end



   session[:cards_left_in_deck] = session[:current_deck].cards.clone
   session[:current_card] = session[:cards_left_in_deck].pop

   erb :show_deck
end

post "/answer" do
  answer = params[:user_answer]

  if answer == session[:current_card].answer
    session[:current_card_answered?] = true
  else
    session[:current_card_answered?] = false
  end

  session[:current_card] = session[:cards_left_in_deck].pop if session[:current_card_answered?]

  redirect '/deck'
end
