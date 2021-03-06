#this is a character creator program for use in a combat simulator for a game system I've been designing with a friend of mine.
#it doesn't implement all the features of the game (even when restricting to character creation) but i think that's fine.
#it was created as an alternative tabletop role-playing game (D&D is the famous example)
#the basic premise is two fighters take turns using skills and allocating energy to their attacks and defenses until one of them wins the fight. 
=begin
Pseudocode for features NOTE THAT A LOT OF THIS PSEUDOCODE DOESN'T QUITE MATCH THE ACTUAL CODE. I REFINED ON IT WHEN I MADE THE METHODS

methods/driver code:
  SETUP:
    -if not already created: make db, characters table, "class" table (as in character class in the game, not a ruby class), equipment tables

  START:
    -welcome player and ask what feature they'd like to access: create, edit, or view
    -run the relevant methods based on their response.

  CHARACTER CREATION:
    -driver code that uses gets.chomp and puts to ask questions where relevant and run the appropriate methods to create a character
      -creates an array for relevant data
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


    EDIT: I created two identical skills tables intentionally so that i could reference two different skills to them. I couldn't find an easy way to reference two things from the same table. I'll ask about this in office hours soon.
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

  skill_table1_cmd = <<-SQL
    CREATE TABLE IF NOT EXISTS skills1 (
      id INTEGER PRIMARY KEY,
      name VARCHAR(225),
      levels INT,
      activate_during VARCHAR(225),
      usable_for_id INT,
      description VARCHAR(225),
      FOREIGN KEY (usable_for_id) REFERENCES classes(id)
    );
  SQL

  skill_table2_cmd = <<-SQL
    CREATE TABLE IF NOT EXISTS skills2 (
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
  db.execute(skill_table1_cmd)
  db.execute(skill_table2_cmd) #fix this after i can ask about it!
  db.execute(weapon_table_cmd)
  db.execute(armor_table_cmd)
end

def populate_data_tables(db)
  db.execute("INSERT INTO classes (name, base_class_skill) VALUES ('soldier', 'boost defense when committing to a strong defense')")
  db.execute("INSERT INTO classes (name, base_class_skill) VALUES ('warrior', 'boost offense when committing to a strong attack')")
  db.execute("INSERT INTO skills1 (name, levels, activate_during, usable_for_id, description) VALUES ('aggression', 2, 'always', 2, 'Increases attack numbers by +1 per level')")
  db.execute("INSERT INTO skills1 (name, levels, activate_during, usable_for_id, description) VALUES ('lightning reflexes', 1, 'during the jump', 2, 'increases likelihood to get the first strike in combat')")
  db.execute("INSERT INTO skills1 (name, levels, activate_during, usable_for_id, description) VALUES ('measured ferocity', 1, 'during a planning round', 2, 'has access to less energy for three rounds but gets a boost on the fourth')")
  db.execute("INSERT INTO skills1 (name, levels, activate_during, usable_for_id, description) VALUES ('armored', 2, 'always', 1, 'increases the defense value of your armor')")
  db.execute("INSERT INTO skills1 (name, levels, activate_during, usable_for_id, description) VALUES ('changing tides', 1, 'during a planning round', 1, 'has access to less energy for two rounds, then more energy for the next two rounds')")
  db.execute("INSERT INTO skills1 (name, levels, activate_during, usable_for_id, description) VALUES ('better blocker', 1, 'always', 1, 'increases the defense-die size when blocking with a shield')")
  db.execute("INSERT INTO skills2 (name, levels, activate_during, usable_for_id, description) VALUES ('aggression', 2, 'always', 2, 'Increases attack numbers by +1 per level')")
  db.execute("INSERT INTO skills2 (name, levels, activate_during, usable_for_id, description) VALUES ('lightning reflexes', 1, 'during the jump', 2, 'increases likelihood to get the first strike in combat')")
  db.execute("INSERT INTO skills2 (name, levels, activate_during, usable_for_id, description) VALUES ('measured ferocity', 1, 'during a planning round', 2, 'has access to less energy for three rounds but gets a boost on the fourth')")
  db.execute("INSERT INTO skills2 (name, levels, activate_during, usable_for_id, description) VALUES ('armored', 2, 'always', 1, 'increases the defense value of your armor')")
  db.execute("INSERT INTO skills2 (name, levels, activate_during, usable_for_id, description) VALUES ('changing tides', 1, 'during a planning round', 1, 'has access to less energy for two rounds, then more energy for the next two rounds')")
  db.execute("INSERT INTO skills2 (name, levels, activate_during, usable_for_id, description) VALUES ('better blocker', 1, 'always', 1, 'increases the defense-die size when blocking with a shield')")
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
  fighter_name = gets.chomp
  fighter_data << fighter_name
  
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
    if class_number == 1
      skill_id = id.to_i + 3
    else
      skill_id = id.to_i
    end
    fighter_data << skill_id
  end

  db.execute("INSERT INTO fighters (name, str, dex, con, weapon_set_id, armor_id, class_id, skill1_id, skill2_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", fighter_data)

  view_fighter(db, fighter_name)
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
      FOREIGN KEY (skill1_id) REFERENCES skills1(id)
      FOREIGN KEY (skill2_id) REFERENCES skills2(id)
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

  skill_hashes = db.execute("SELECT * FROM skills1 WHERE usable_for_id=#{class_id}")
  skill_hashes.delete_at(2) if class_id == 1 && weapon_id == 2
  puts "Skill info:"
  puts ""
  puts " ---------------- "
  puts ""

  skill_hashes.each do |skill_hash|
    skill_hash.each_pair do |primary_key, value|
      next if primary_key == "usable_for_id" || primary_key.class != String
      if primary_key == "id" 
        puts "#{value}"
      elsif primary_key == "activate_during"
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

def view_fighter(db, fighter_name)
  view_cmd = "
    SELECT fighters.name, fighters.str, fighters.dex, fighters.con, weapons.name, armors.name, classes.name, skills1.name, skills2.name 
    FROM fighters
    JOIN weapons ON fighters.weapon_set_id=weapons.id
    JOIN armors ON fighters.armor_id=armors.id
    JOIN classes ON fighters.class_id=classes.id
    JOIN skills1 ON fighters.skill1_id=skills1.id
    JOIN skills2 ON fighters.skill2_id=skills2.id
    WHERE fighters.name = '#{fighter_name}'
    "
  fighter_hash = db.execute(view_cmd)[0]
  
  #note that the following is using the numerical keys sqlite3 provides because the name primary key keys were messed up. I also plan to ask about this.
  keys = ["Name", "Strength", "Dexterity", "Constitution", "Weapons", "Armor", "Class", "Skill 1", "Skill 2"]

  9.times do |i|
    puts "#{keys[i]}: #{fighter_hash[i]}"
  end
end

def view_character_list(db)
  puts "The current list of characters is:"
  puts ""
  names = db.execute("SELECT fighters.name FROM fighters")
  names.each do |hash_of_name|
    puts hash_of_name["name"]
  end
  puts ""
  return names
end

def view_command(db)
  names = view_character_list(db)
  puts "Enter any name to view that particular fighter or enter all to view all fighters"
  fighter_name = gets.chomp
  puts ""
  if fighter_name.downcase == "all"
    names.each do |hash_of_name|
      view_fighter(db, hash_of_name["name"])
      puts ""
    end
  else
    view_fighter(db, fighter_name)
    puts ""
  end
end

def edit_command(db)
  view_character_list(db)
  puts "Which character would you like to edit?"
  character_to_edit = gets.chomp
  character_info_hash = db.execute("SELECT * FROM fighters WHERE name='#{character_to_edit}'")[0]
  puts ""
  puts "Here are their stats:"
  puts ""
  view_fighter(db, character_to_edit)
  puts ""
  puts "What data would you like to edit? (if you want to change a skill, enter 'skills' and you will be prompted to change both)"
  data_to_edit = gets.chomp.downcase
  case data_to_edit

  when "name"
    puts "What would you like the new name to be?"
    new_name = gets.chomp
    db.execute("UPDATE fighters SET name='#{new_name}' WHERE name= '#{character_to_edit}'")

  when "strength"
    puts "What would you like the new strength score to be?"
    new_str = gets.chomp.to_i
    db.execute("UPDATE fighters SET str=#{new_str} WHERE name='#{character_to_edit}'")

  when "dexterity"
    puts "What would you like the new dexterity score to be?"
    new_dex = gets.chomp.to_i
    db.execute("UPDATE fighters SET dex=#{new_dex} WHERE name='#{character_to_edit}'")

  when "constitution"
    puts "What would you like the new constitution score to be?"
    new_con = gets.chomp.to_i
    db.execute("UPDATE fighters SET con=#{new_con} WHERE name='#{character_to_edit}'")

  when "weapons"
    puts "Which weapon set would you like to use, 'sword and light shield', 'war pick', or 'mace and heavy shield'?"
    case  gets.chomp.downcase
    when 'sword and light shield'
      new_weapons = 1
    when 'war pick'
      new_weapons = 2
    when 'mace and heavy shield'
      new_weapons = 3
    else 
      puts "incorrect entry"
      return
    end
    db.execute("UPDATE fighters SET weapon_set_id=#{new_weapons} WHERE name='#{character_to_edit}'")

  when "armor"
    puts "Which armor would you like to use, 'leather armor', 'scale armor', or 'full plate armor'?"
    case gets.chomp.downcase
    when 'leather armor'
      new_armor = 1
    when 'scale armor'
      new_armor = 2
    when 'full plate armor'
      new_armor = 3
    else
      puts "incorrect entry"
      return
    end
    db.execute("UPDATE fighters SET armor_id=#{new_armor} WHERE name='#{character_to_edit}'")

  when "class"
    puts "Would you like to be a Warrior or a Soldier?"
    case gets.chomp.downcase
    when "soldier"
      new_class = 1
    when "warrior"
      new_class = 2
    else
      puts "incorrect entry"
      return
    end
    puts ""
    puts "You must also now change your skills:"
    new_skills = select_skills(db, new_class, character_info_hash["weapon_set_id"])
    skill1 = new_skills[0].to_i
    skill2 = new_skills[1].to_i
    db.execute("UPDATE fighters SET class_id=#{new_class}, skill1_id=#{skill1}, skill2_id=#{skill2} WHERE name='#{character_to_edit}'")

  when "skills"
    new_skills = select_skills(db, character_info_hash["class_id"], character_info_hash["weapon_set_id"])
    skill1 = new_skills[0].to_i
    skill2 = new_skills[1].to_i 
    db.execute("UPDATE fighters SET skill1_id=#{skill1}, skill2_id=#{skill2} WHERE name='#{character_to_edit}'")

  else
    puts "Whoops! That wasn't one of the options!"
  end

  puts "Here's the character with the edited data:"
  puts ""
  if data_to_edit == "name"
    view_fighter(db, new_name)
  else
    view_fighter(db, character_to_edit)
  end
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


puts "Welcome! This is a character creation program for a stripped down version of a game I'm trying to design with a friend from college."
continue = true
while continue
  puts "You can:"
  puts "Create a new character"
  puts "Edit an existing character"
  puts "Or simply view any or all of the existing characters"
  puts "What would you like to do? (input 'create', 'edit', 'view', or 'exit')"
  case gets.chomp.downcase

  when "create"
    create_fighter(db)

  when "view"
    view_command(db)

  when "edit"
    edit_command(db)

  when "exit"
    continue = false

  else
    puts "Whoops! That wasn't one of the options!"
  end
end
