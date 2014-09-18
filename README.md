Flash Cards MVP:
user can see a single flashcard
user can play a "round," which is a series of guesses over all the cards in a deck
user can make a guess on a single flashcard
user is told if they make an incorrect guess
---------------------------------------------
user can skip a flashcard
user can guess on skipped flashcards after running through the deck once

user skips a flashcard if they guess incorrectly too many times
user receives a score at the end of the game


user can choose a deck to play
user can create their own deck

user can log in
user can see all their past scores
user can see a high score table

user sees a styled site
user sees a responsively styled site




> **Note**: This branch (master) contains a skeleton without any app code, perfect for creating a _new_ application or challenge. If you're looking for an example app built with this skeleton, take a look at the [example](/../..//tree/example) branch which includes basic CRUD and RSpec tests.

### Purpose
The Sinatra Skeleton:

1. Provides a foundation for building challenges or creating a new Sinatra application.
2. Demonstrates a reasonable set of practices around building Sinatra applications.
3. Eases the transition to Rails for Dev Bootcamp students

### Quickstart

1.  `bundle install`
2.  `shotgun config.ru`

As needed, create models & migrations with the `rake` tasks:

```
rake generate:migration  # Create an empty migration in db/migrate, e.g., rake generate:migration NAME=create_tasks
rake generate:model      # Create an empty model in app/models, e.g., rake generate:model NAME=User
```

### Contributing

We would love for you to help make the skeleton more awesome, There are three ways to contribute:

1. Ask for a bug fix or enhancement!
2. Submit a pull request for a bug fix or enhancement!
3. Code review an open pull request!

Be prepared to give and receive specific, actionable, and kind feedback!
