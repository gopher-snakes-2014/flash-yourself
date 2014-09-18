
seed_deck = Deck.create(category: "Random")

[
["Which planet has the largest moon: Earth, Jupiter or Saturn? ", "Jupiter"],
["What is the largest organ in the human body", "skin"],
["What do  you call a group of porcupines? ", "prickle"],
["What is the most popular beer in the world(10.3 billion liters in 2013)", "Snow"],
["Which planet has the largest moon: Earth, Jupiter or Saturn? ", "Jupiter"],
["In what year was the internet invented?", "1958"],
["What type of tree loses it's leaves?", "deciduous"]



].each do |array|

new_question = Card.create(question: array[0], answer: array[1])
new_question.deck = seed_deck
new_question.save
end


