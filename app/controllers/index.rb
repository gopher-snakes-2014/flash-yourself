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
