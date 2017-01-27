#Accept string
  #Iterate over each character in string
  #Advance each character by one value
  #Return results
  #Deal with z -> aa
def encrypt(str)
  i = 0
  while i < str.length
    if str[i] == "z"
      then str[i] = "a"
    else
        str[i] = str[i].next
    end 
    i += 1
  end
  return str
end

#Define alphabet string
  #Isolate indices
  #Put them back based on position in alphabet string
def decrypt(str)
  i = 0
  alpha = "abcdefghijklmnopqrstuvwxyz"
  while i < str.length
    str[i] = alpha[alpha.index(str[i])-1]
     #str[i] retrieves letter, alpha.index retrieves index number of letter in alphabet
     # -1 moves index back one, and alpha calls previous letter in alphabet
    i += 1
  end
  return str
end

#decrypt(encrypt("swordfish"))
#This works because encrypt runs first, and then decrypt evaluates the encryption

#Ask if you want to encrypt or decrypt
  #Ask for password to carry out operation
  #Print results of conducted operation
puts "Would you like to encrypt or decrypt?"
choice = gets.chomp.downcase
puts "What password would you like encrypted or decrypted?"
password = gets.chomp

if choice == "encrypt"
  puts encrypt(password)
elsif choice == "decrypt"
  puts decrypt(password)
else 
  puts "That wasn't an option, dummy."
end