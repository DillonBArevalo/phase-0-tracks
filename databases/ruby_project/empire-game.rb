#this is a character creator program for use in a combat simulator for a game system I've been designing with a friend of mine.
#it doesn't implement all the features of the game (even when restricting to character creation) but i think that's fine.
#it was created as an alternative tabletop role-playing game (D&D is the famous example)
#the basic premise is two fighters take turns using skills and allocating energy to their attacks and defenses until one of them wins the fight. 
=begin
Pseudocode for features NOTE THAT A LOT OF THIS PSEUDOCODE DOESN'T QUITE MATCH THE ACTUAL CODE. I REFINED ON IT WHEN I MADE THE METHODS

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
      -ask for name and add it to an array
    -method that creates basic stat values and returns them as an array
    -driver code that sets the stat values and sets them to the stats the user wants
    -method that takes basic stats (and array) and adds them to the array
    -method that gives a basic description of classes and asks for which class they'd like to create. adds choice to array
    -method that takes a class and gives skill options for it. lets user choose which skills to have
      -method for doing the above for soldier (class1)
      -method for doing above with warrior (class2)
    -method that takes array and adds it to the db as a character
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


#######NOTE THAT I ASSUME CORRECT INPUT FOR ALL FIELDS WHEN DATA IS REQUESTED!

require "sqlite3"

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
  db.execute("INSERT INTO skills (name, levels, activate_during, usable_for_id, description) VALUES ('aggression', 2, 'always', 2, 'Increases attack numbers by +1 per level')")
  db.execute("INSERT INTO skills (name, levels, activate_during, usable_for_id, description) VALUES ('lightning reflexes', 1, 'during the jump', 2, 'increases likelihood to get the first strike in combat')")
  db.execute("INSERT INTO skills (name, levels, activate_during, usable_for_id, description) VALUES ('measured ferocity', 1, 'during a planning round', 2, 'has access to less energy for three rounds but gets a boost on the fourth')")
  db.execute("INSERT INTO skills (name, levels, activate_during, usable_for_id, description) VALUES ('armored', 2, 'always', 1, 'increases the defense value of your armor')")
  db.execute("INSERT INTO skills (name, levels, activate_during, usable_for_id, description) VALUES ('changing tides', 1, 'during a planning round', 1, 'has access to less energy for two rounds, then more energy for the next two rounds')")
  db.execute("INSERT INTO skills (name, levels, activate_during, usable_for_id, description) VALUES ('better blocker', 1, 'always', 1, 'increases the defense-die size when blocking with a shield')")
  db.execute("INSERT INTO weapons (name, attack_formula, damage_formula, defense_formula, weapon_class) VALUES ('sword and light shield', '1d6 + 2xEnergy', '1d4 + 8', '4 + 1d10 +2xEnergy', 2)")
  db.execute("INSERT INTO weapons (name, attack_formula, damage_formula, defense_formula, weapon_class) VALUES ('war pick', '1d8  + 1.5xEnergy', '1d10 + 15', '5 + 1d10 + 1xEnergy', 1)")
  db.execute("INSERT INTO weapons (name, attack_formula, damage_formula, defense_formula, weapon_class) VALUES ('mace and heavy shield', '1d4 + 1.5xEnergy', '1d4 + 15', '15 + 1d4 + 1.5xEnergy', 1)")
  db.execute("INSERT INTO armors (name, damage_resistance_by_type, energy_budget_reduction, passive_def_boost) VALUES ('leather armor', '3/1/0/2/0', 6, 10)")
  db.execute("INSERT INTO armors (name, damage_resistance_by_type, energy_budget_reduction, passive_def_boost) VALUES ('scale armor', '8/6/4/5/2', 14, 15)")
  db.execute("INSERT INTO armors (name, damage_resistance_by_type, energy_budget_reduction, passive_def_boost) VALUES ('full plate armor', '12/11/8/9/5', 23, 22)")
end

def create_fighter(db)
  make_fighter_table(db)
  
  fighter_data = []

  puts "Let's make a fighter! What would you like to name them?"
  fighter_data << gets.chomp
  
  stats = create_stat_values
  puts ""
  puts "You've rolled the following values for stats:#{stats}."
  puts "What order would you like to prioritize STR DEX and CON in?"
  puts "(write str, dex, and con separated by spaces in the order you'd like them from highest to lowest)"
  order = gets.chomp.downcase.split
  fighter_data << (stats[order.index("str")])
  fighter_data << (stats[order.index("dex")])
  fighter_data << (stats[order.index("con")])

  puts ""

  weapon_number = select_equipmet(db, "weapon")
  fighter_data << weapon_number

  armor_number = select_equipmet(db, "armor")
  fighter_data << armor_number

  class_number = select_class
  fighter_data << class_number

  skills = select_skills(db, class_number, weapon_number)
  skills.each do |id|
    fighter_data << id.to_i
  end

  db.execute("INSERT INTO fighters (name, str, dex, con, weapon_set_id, armor_id, class_id, skill1_id, skill2_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", fighter_data)

  puts db.execute("SELECT * FROM fighters;") #PLACEHOLDER FOR THE VIEW FIGHTER METHOD
end

def make_fighter_table(db)
  fighter_table_cmd = <<-SQL
    CREATE TABLE IF NOT EXISTS fighters (
      id INTEGER PRIMARY KEY,
      name VARCHAR(255),
      str INT,
      dex INT,
      con INT,
      weapon_set_id INT,
      armor_id INT,
      class_id INT,
      skill1_id INT,
      skill2_id INT,
      FOREIGN KEY (weapon_set_id) REFERENCES weapon_sets(id),
      FOREIGN KEY (armor_id) REFERENCES aromr(id),
      FOREIGN KEY (class_id) REFERENCES classes(id)
      FOREIGN KEY (skill1_id) REFERENCES skills(id)
      FOREIGN KEY (skill2_id) REFERENCES skills(id)
    );
  SQL
  db.execute(fighter_table_cmd)
end

def create_stat_values()
  stats = []
  3.times do |i|
    stats << 6 + (rand(6) + 1) + (rand(6) +1)
  end 
  return stats.sort.reverse
end

def select_equipmet(db, equipment_type)
  hashes = db.execute("SELECT * FROM #{equipment_type}s;")
  
  choice = nil

  while choice != "1" && choice != "2" && choice != "3"
    puts "You have the following #{equipment_type} options:"
    puts ""
    3.times do |i|
      puts "#{i + 1}. #{hashes[i]['name']}"
    end
    puts ""
    puts "select 1, 2, or 3. or ask for more details on any #{equipment_type} option by typing 'details ' followed by the #{equipment_type} number"
    
    choice = gets.chomp

    puts ""

    if choice == "1" || choice == "2" || choice == "3"
      break
    end

    details_for = choice.split[1].to_i - 1

    puts ""
    puts " ---------------- "
    puts ""

    hashes[details_for].each_pair do |primary_key, value|
      next if primary_key == "id"
      next if primary_key.class != String
      puts "#{equipment_type} #{primary_key.split("_").join(" ")}: #{hashes[details_for][primary_key]}"
    end
    
    puts ""
    puts " ---------------- "
    puts ""
  end

  return choice.to_i
end

def select_class()
  puts "You have two choices for your fighter's class!"
  puts "They can be either a Warrior or a Soldier."
  puts ""
  puts "Soldiers focus on defense and have skills that help them not take damage."
  puts ""
  puts "Warriors, on the other hand, focus on offense. They have skills that boost their damage, and help them get the first strike off."
  puts ""
  puts "Which class would you like to use? input 1 to choose Soldier and 2 to choose Warrior"
  return gets.chomp.to_i
end

def select_skills(db, class_id, weapon_id)
  puts ""
  puts "Depending on the class you chose you now get to choose 2 skills from your class skill list!"
  puts "If a skill has 2 levels you may choose it with both of your choices"
  puts ""
  puts "**Note that if you selected a war pick and a Soldier one of the skills will not appear in the list of possible skills as it has to do with a shield**"

  skill_hashes = db.execute("SELECT * FROM skills WHERE usable_for_id=#{class_id}")
  skill_hashes.delete_at(2) if class_id == 1 && weapon_id == 2
  puts "Skill info:"
  puts ""
  puts " ---------------- "
  puts ""

  skill_hashes.each do |skill_hash|
    skill_hash.each_pair do |primary_key, value|
      next if primary_key == "id" || primary_key == "usable_for_id" || primary_key.class != String
      if primary_key == "activate_during"
        puts "This ability is available: #{value}"
      else
        puts "#{primary_key}: #{value}"
      end
    end
    puts ""
  end

  puts ""
  puts " ---------------- "
  puts ""
  
  puts "Enter the numbers corresponding to the two skills you'd like to choose separated by a space"
  puts "remember you can take the same skill twice if it has two levels"
  
  skills = gets.chomp.split
  return skills
end

#==========Driver Code=============

if !File.exist?("empire_fight.db")
  db=SQLite3::Database.new("empire_fight.db")
  make_data_tables(db)
  populate_data_tables(db)
  puts "Created initial data and tables"
else
  db=SQLite3::Database.new("empire_fight.db")
end
db.results_as_hash = true

create_fighter(db)