# Booglan Language Parser

## About Booglan

First, the Booglan letters are classified in two groups: the letters r, t, c, d and b are called "foo letters" while the other letters are called "bar letters".  
The linguists have discovered that in the Booglan language, the prepositions are the words of exactly 5 letters which end in a bar letter and do not contain the letter l.

Another interesting fact discovered by linguists is that, in the Booglan language, verbs are words of 8 letters or more that end in a bar letter. Furthermore, if a verb starts in a bar letter, then the verb is inflected in its subjunctive form.

In Booglan, like in our system, words are always ordered lexicographically, but the challenge is that the order of the letters in the Booglan alphabet is different from ours. Their alphabet, in order, is: twhzkdfvcjxlrnqmgpsb.

In Booglan, words also represent numbers given in base 20, where each letter is a digit. The digits are ordered from the least significant to the most significant, which is the opposite of our system. That is, the leftmost digit is the unit, the second digit is worth 20, the third one is worth 400, and so on and so forth. The values of the letters are given by the order they appear in the Booglan alphabet (which, as we saw, is ordered differently from our alphabet). That is, the first letter of the Booglan alphabet represents the digit 0, the second letter represents the digit 1, and the last one represents the digit 19.

Booglans consider a number to be pretty if it satisfies all of the following properties:
- it is greater than or equal to 422224
- it is divisible by 3

## Project Dependencies

- Ruby 2.4.1

## Setting Up the Project

First, make sure to have the correct Ruby version installed (you can use [rbenv](https://github.com/rbenv/rbenv) to accomplish that) and the [Bundler](https://bundler.io/) gem . Then, install dependencies:
```ruby
bundle install
```

To run the tests:
```ruby
bundle exec rspec
```

To get information about a specific text on Booglan language, execute:
```ruby
ruby src/index.rb path_to_file
```
