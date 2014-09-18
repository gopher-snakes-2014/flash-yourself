require_relative 'spec_helper'
describe "Card" do
  before(:all) do
    @some_deck = Deck.all.sample
    @cards = []
    10.times {
      @cards << Card.create(
        :question => Faker::Lorem.sentence(rand(4)+4),
        :answer => Faker::Lorem.word,
        :belongs_to => @some_deck
      )
    }


  end

  it "is a card" do
    6.times {
      expect(@cards.sample.class).to eq Card
    }

  end
  it "belongs to a deck" do
    expect(@cards.sample.deck).to eq @some_deck
  end
  it "shares a deck with other cards" do
    some_card = @cards.sample
    expect(some_card.deck.cards).to include some_card
  end
  it "has a question and an answer" do
    @cards.each { |card|
      some_question = card.question
      some_answer = card.answer

      expect(Card.find_by(:question=>some_question).answer).to eq some_answer
     }
  end
end
