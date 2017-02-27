#this is a character creator program for use in a combat simulator for a game system I've been designing with a friend of mine.
#it doesn't implement all the features of the game (even when restricting to character creation) but i think that's fine.
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
    -if not already created: make db, characters table, "class" table (as in character class in the game, not a ruby class), equipment tables

  START:
    -welcome player and ask what feature they'd like to access: create, edit, or view
    -run the relevant methods based on their response.

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
    -run view character  method for newly created character

  VIEW CHARACTERS:
    -ask to view all characters or to simply view names and select which one to view in detail
    -create methods for both.

  EDIT CHARACTER:
    -choose character to edit
    -ask if you would like to edit equipment, stats, or class/skills?
    -display choices based on response
    -update database
    -display new results
=end

require "sqlite3"

db=SQLite3::Database.new("empire_fight.db")
db.results_as_hash = true

def make_data_tables(db)
  #make weapon table, armor table, class table, and skills table
  class_table_cmd = <<-SQL
    CREATE TABLE IF NOT EXISTS classes (
      id INTEGER PRIMARY KEY,
      name VARCHAR(225),
      base_class_skill VARCHAR(225)
    );
  SQL

  skill_table_cmd = <<-SQL
    CREATE TABLE IF NOT EXISTS skills (
      id INTEGER PRIMARY KEY,
      name VARCHAR(225),
      levels INT,
      activate_during VARCHAR(225),
      usable_for_id INT,
      description VARCHAR(225),
      FOREIGN KEY (usable_for_id) REFERENCES classes(id)
    );
  SQL

  weapon_table_cmd = <<-SQL
    CREATE TABLE IF NOT EXISTS weapons (
      id INTEGER PRIMARY KEY,
      name VARCHAR(225),
      attack_formula VARCHAR(225),
      damage_formula VARCHAR(225),
      defense_formula VARCHAR(225),
      weapon_class INT
    );
  SQL

  armor_table_cmd = <<-SQL
    CREATE TABLE IF NOT EXISTS armors (
      id INTEGER PRIMARY KEY,
      name VARCHAR(225),
      damage_resistance_by_type VARCHAR(225),
      energy_budget_reduction INT,
      passive_def_boost INT
    );
  SQL
  db.execute(class_table_cmd)
  db.execute(skill_table_cmd)
  db.execute(weapon_table_cmd)
  db.execute(armor_table_cmd)
end

def populate_data_tables(db)
  db.execute("INSERT INTO classes (name, base_class_skill) VALUES ('soldier', 'boost defense when committing to a strong defense')")
  db.execute("INSERT INTO classes (name, base_class_skill) VALUES ('warrior', 'boost offense when committing to a strong attack')")
  db.execute("INSERT INTO skills (name, levels, activate_during, usable_for_id) VALUES ('aggression', 2, 'always', 2, 'Increases attack numbers by +1 per level')")
  db.execute("INSERT INTO skills (name, levels, activate_during, usable_for_id) VALUES ('lightning reflexes', 1, 'during the jump', 2, 'increases likelihood to get the first strike in combat')")
  db.execute("INSERT INTO skills (name, levels, activate_during, usable_for_id) VALUES ('measured ferocity', 1, 'during a planning round', 2, 'has access to less energy for three rounds but gets a boost on the fourth')")
  db.execute("INSERT INTO skills (name, levels, activate_during, usable_for_id) VALUES ('armored', 2, 'always', 1, 'increases the defense value of your armor')")
  db.execute("INSERT INTO skills (name, levels, activate_during, usable_for_id) VALUES ('changing tides', 1, 'during a planning round', 1, 'has access to less energy for two rounds, then more energy for the next two rounds')")
  db.execute("INSERT INTO skills (name, levels, activate_during, usable_for_id) VALUES ('better blocker', 1, 'always', 1, 'increases the defense-die size when blocking with a shield')")
  db.execute("INSERT INTO weapons (name, attack_formula, damage_formula, defense_formula, weapon_class) VALUES ('sword and light shield', '1d6 + 2xEnergy', '1d4 + 8', '4 + 1d10 +2xEnergy', 2)")
  db.execute("INSERT INTO weapons (name, attack_formula, damage_formula, defense_formula, weapon_class) VALUES ('war pick', '1d8  + 1.5xEnergy', '1d10 + 15', '5 + 1d10 + 1xEnergy', 1)")
  db.execute("INSERT INTO weapons (name, attack_formula, damage_formula, defense_formula, weapon_class) VALUES ('mace and heavy shield', '1d4 + 1.5xEnergy', '1d4 + 15', '15 + 1d4 + 1.5xEnergy', 1)")
  db.execute("INSERT INTO armors (name, damage_resistance_by_type, energy_budget_reduction, passive_def_boost) VALUES ('leather armor', '3/1/0/2/0', 6, 10)")
  db.execute("INSERT INTO armors (name, damage_resistance_by_type, energy_budget_reduction, passive_def_boost) VALUES ('scale armor', '8/6/4/5/2', 14, 15)")
  db.execute("INSERT INTO armors (name, damage_resistance_by_type, energy_budget_reduction, passive_def_boost) VALUES ('full plate armor', '12/11/8/9/5', 23, 22)")
end

def make_fighter_table(db)
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



def startup()
  

end


#==========Driver Code=============

populate_data_tables(db)
if !File.exist?("empire_fight.db")
  make_data_tables(db)
  populate_data_tables(db)
end