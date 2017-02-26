#this is a combat simulator for a game system I've been designing with a friend of mine.
#it was created as an alternative tabletop role-playing game (D&D is the famous example)
#the basic premise is two fighters take turns using skills and allocating energy to their attacks and defenses until one of them wins the fight. 
=begin
Pseudocode for features 

CHARACTER CREATION:
-allow input for character creation. 
  -roll basic stats and allow them to be put into the character. 
  -with basic stats, calculate relevant multi-stat values and display them for the user
  -allow for a choice between two classes
  -allow for a choice between 3 weapon sets
  -allow for a choice of 2 skills from a short list for each class

-add a method to display character stats that runs at the end of character creation.
  -break it into two methods: deep stats (things that wouldn't be relevant during combat) and combat stats
  -run both at the end of character creation

BATTLE:
-allow two fighters to be chosen (and have a stock fighter creation method)
  -display a list of fighters with their stats displayed for choosing
  -choose the fighter you will be playing and your automated opponent (if it gets too tricky i might not use automation for fighting or i might implement a very basic algorithm for it.)

-run fight
  -roll for jump and award the winner the first attack.
  -allow for energy allocation and use of skills (if relevant)
  -display health, damage, and energy for/after each strike
  -end when one player is at 0 health (or less)

-implement pause feature?
  -create a new table that has paused fights. it'll have to have to reference two characters, whose turn it is, current healths, and current energy (both pool and budget)


methods:


=end