require_relative 'spec_helper'
describe "Card" do
  before(:all) do
    @new_decks = []
    6.times {
      @new_decks << Deck.create(:category=>Faker::Lorem.word)
    }

    @cards = []
    10.times {
       a_card = Card.create(
        :question => Faker::Lorem.sentence(rand(4)+4),
        :answer => Faker::Lorem.word
      )
      a_card.deck = Deck.all.sample
      a_card.save
      @cards <<a_card
    }
  end

  it "is a card" do
    6.times {
      expect(@cards.sample.class).to eq Card
    }

  end

  it "shares a deck with other cards" do
    some_card = @cards.sample
    expect(some_card.deck.cards.all).to include some_card
  end
  it "has a question and an answer" do
    @cards.each { |card|
      some_question = card.question
      some_answer = card.answer

      expect(Card.find_by(:question=>some_question).answer).to eq some_answer
     }
  end
end
