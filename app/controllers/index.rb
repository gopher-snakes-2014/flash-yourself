#displays the decks
get '/' do
  @decks = [{id: 1, category: 'Fruit' }, {id: 2, category: 'cars'}]
  @cards = [{id: 3, deck_id: 1, question: "is an orange citrus fruit", answer: "orange"},
    {id: 3, deck_id: 1, question: "is an red fruit", answer: "apple"}]
  erb :index
end

#takes you to deck by id ex 'fruits',
#shows all the cards for a specific deck
get '/deck/:id' do
   @current_deck = Deck.find(params[:id])
   #finding all cards with deck id
   @all_card_in_deck = Card.find_by(deck_id: 1)
  erb :show_deck

end

#deck.cards
