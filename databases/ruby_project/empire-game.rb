#this is a character creator program for use in a combat simulator for a game system I've been designing with a friend of mine.
#it was created as an alternative tabletop role-playing game (D&D is the famous example)
#the basic premise is two fighters take turns using skills and allocating energy to their attacks and defenses until one of them wins the fight. 
=begin
Pseudocode for features 

CHARACTER CREATION:
  -allow input for character creation. 
    -roll basic stats and allow them to be put into the character. 
    -with basic stats, calculate relevant multi-stat values and display them for the user
    -allow for a choice between two "classes" (meaning game class, not coding class)
    -allow for a choice between 3 weapon sets
    -allow for a choice of 2 skills from a short list for each class

  -add a method to display character stats that runs at the end of character creation.
    -break it into two methods: deep stats (things that wouldn't be relevant during combat) and combat stats
    -run both at the end of character creation


methods/driver code:
  SETUP:
    -if not already created: make db, characters table, pause state table, "class" table, equipment table

  START:
    -welcome player and ask what feature they'd like to access: create, edit, or view
    -run the relevant program based on their response.

  CHARACTER CREATION:
    -driver code that uses gets.chomp and puts to ask questions where relevant and run the appropriate methods to create a character
      -creates a hash for relevant data
      -ask for name and add it to hash
    -method that creates basic stat values and returns them as an array
    -driver code that sets the stat values and sets them to the stats the user wants
    -method that takes basic stats (and hash) and adds them to the hash
    -method that gives a basic description of classes and asks for which class they'd like to create. adds choice to hash
    -method that takes a class and gives skill options for it. lets user choose which skills to have
      -method for doing the above for soldier (class1)
      -method for doing above with warrior (class2)
    -method that takes hash and adds it to the db as a character

  VIEW CHARACTERS:

  EDIT CHARACTER:
    -choose character to edit
    -ask if you would like to edit equipment, stats, or class/skills?
    -display choices based on response
    -update database
    -display new results
=end

require "sqlite3"

def make_data_tables()
  class_table_cmd = <<-SQL
    CREATE TABLE classes (
      id INTEGER PRIMARY KEY,

    );
  SQL
end

def make_fighter_table()
  fighter_table_cmd = <<-SQL
    CREATE TABLE fighers (
      id INTEGER PRIMARY KEY,
      name VARCHAR(255),
      str INT,
      dex INT,
      con INT,
      weapon_set_id VARCHAR(225),
      armor_id VARCHAR(225),
      class_id INT,
      FOREIGN KEY (weapon_set_id) REFERENCES weapon_sets(id),
      FOREIGN KEY (armor_id) REFERENCES aromr(id),
      FOREIGN KEY (class_id) REFERENCES classes(id)
    );
  SQL
end

def make_pause_table()
end



def startup()
  db=SQLite3::Database.new("empire_fight.db")

end