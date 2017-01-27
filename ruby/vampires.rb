puts "How many employees would you like to process?"
number = gets.chomp.to_i
i = 1


while i <= number
  puts "What's your name?"
  name=gets.chomp
  puts "How old are you?"
  age=gets.chomp.to_i
  puts "What year were you born?"
  birth_year=gets.chomp.to_i
  puts "Our company cafeteria serves garlic bread. Should we order some for you? (yes/no)"
  bread=gets.chomp.downcase
  puts "Would you like to enroll in the company’s health insurance? (yes/no)"
  insurance=gets.chomp.downcase
  current_year=2017 

  vampire_status = "Results inconclusive"

  if current_year-birth_year == age && (bread=="yes" || insurance == "yes")
    vampire_status = "Probably not a vampire."
  end

  if current_year-birth_year != age && (bread == "no" || insurance == "no")
    vampire_status = "Probably a vampire"
  end

  if current_year-birth_year != age && bread == "no" && insurance == "no"
    vampire_status = "Almost certainly a vampire"
  end

  if name == "Drake Cula" || name == "Tu Fang"
    vampire_status = "Definitely a vampire"
  end

  more_allergies = true
  puts "do you have any allergies? (list allergies one by one. when finished, enter 'no')"
  while more_allergies
    allergy=gets.chomp
    if allergy == "no"
      more_allergies = false
    elsif allergy.downcase == "sunshine"
      vampire_status = "Probably a vampire"
      break
    end
  end

  puts vampire_status

  i +=1
end
puts  "Actually, never mind! What do these questions have to do with anything? Let's all be friends."