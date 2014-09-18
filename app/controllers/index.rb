get '/' do
  @decks = [{id: 1, category: 'Fruit' }, {id: 2, category: 'cars'}]
  erb :index

end

get '/deck/' do
  'shakrah says hello'
end
