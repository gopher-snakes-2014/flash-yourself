
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

seed_deck = Deck.create(category: "Technology")

[
["The first step to getting output from a laser is to excite an active medium. What is this process called?", "pumping"],
["A given signal's second harmonic is twice the given signal's __________ frequency.", "fundamental"],
["In what year was the '@' chosen for its use in e-mail addresses?","1972"],
["What is the term to ask the computer to put information in order numerically or alphabetically?", "sort"],
["What is part of a database that holds only one type of information?", "field"],
["Which consists of two plates separated by a dielectric and can store a charge?", "capacitor"]

].each do |array|

new_question = Card.create(question: array[0], answer: array[1])
new_question.deck = seed_deck
new_question.save
end

seed_deck = Deck.create(category: "Movies")

[
["Which country has won the most soccer World Cups?", "Brazil"],
["What company's logo is called the 'swoosh'?", "Nike"],
["How many Super Bowls have the 49ers won?","5"],
["Which country is hosting the 2016 Summer Olympics?", "Brazil"],
["What is part of a database that holds only one type of information?", "field"],
["Which consists of two plates separated by a dielectric and can store a charge?", "capacitor"]

].each do |array|

new_question = Card.create(question: array[0], answer: array[1])
new_question.deck = seed_deck
new_question.save
end

seed_deck = Deck.create(category: "Grammar")


[["A category to which a word is assigned in accordance with its syntactic functions. In English the main parts of speech are noun, pronoun, adjective, determiner, verb, adverb, preposition, conjunction, and interjection.", "Noun"],

["A word used to describe an action, state, or occurrence, and forming the main part of the predicate of a sentence, such as hear, become, happen.", "Verb"],

["A word or phrase naming an attribute, added to or grammatically related to a noun to modify or describe it.", "Adjective"],

[" A word used to connect clauses or sentences or to coordinate words in the same clause.", "Conjunction"],

["A word governing, and usually preceding, a noun or pronoun and expressing a relation to another word or element in the clause.", "Preposition"],

["A unit of grammatical organization next below the sentence in rank and in traditional grammar said to consist of a subject and predicate.", "Clause"],

["A word or phrase that modifies or qualifies an adjective, verb, or other adverb or a word group, expressing a relation of place, time, circumstance, manner, cause, degree, etc.", "Adverb"],

["A word that can function by itself as a noun phrase and that refers either to the participants in the discourse (e.g., I, you) or to someone or something mentioned elsewhere in the discourse (e.g., she, it, this).", "Pronoun"],

["A single distinct meaningful element of speech or writing, used with others (or sometimes alone) to form a sentence and typically shown with a space on either side when written or printed.", "Word"],

["A small group of words standing together as a conceptual unit, typically forming a component of a clause.", "Phrase"]
].each do |array|

new_question = Card.create(question: array[0], answer: array[1])
new_question.deck = seed_deck
new_question.save
end
