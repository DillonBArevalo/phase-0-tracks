# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

 "iNvEsTiGaTiOn".swapcase
 "iNvEsTiGaTiOn".swapcase!
# => “InVeStIgAtIoN”

 "zom".gsub(/[o]/, "oo")
 "zom".gsub!(/[o]/, "oo")
 "zom".sub(/[o]/, "oo")
 "zom".sub!(/[o]/, "oo")
 "zom".insert(1,"o") #or with index of 2
# => “zoom”

 "enhance".center(15)
# => "    enhance    "

 "Stop! You’re under arrest!".upcase
 "Stop! You’re under arrest!".upcase!
# => "STOP! YOU’RE UNDER ARREST!"

 "the usual".concat(" suspects")
 "the usual".insert(-1, " suspects")
#=> "the usual suspects"

 " suspects".prepend("the usual")
 " suspects".insert(0, "the usual")
# => "the usual suspects"

 "The case of the disappearing last letter".chop
 "The case of the disappearing last letter".chop!
# => "The case of the disappearing last lette"

 "The mystery of the missing first letter".delete("T")
 "The mystery of the missing first letter".slice(1...39)
 "The mystery of the missing first letter".slice!(1...39)
# => "he mystery of the missing first letter"

 "Elementary,    my   dear        Watson!".squeeze(" ")
 "Elementary,    my   dear        Watson!".squeeze!(" ")
# => "Elementary, my dear Watson!"

 "z".ord
# => 122 
# (What is the significance of the number 122 in relation to the character z?)
# It's the ascii decimal for it. (or the integer ordinal)

 "How many times does the letter 'a' appear in this string?".count("a")
# => 4

#note that replace or sub could work for all but the last two, but that doesn't seem like a good answer to any of them (except the one I answered with sub).
#also note that some of these are possible with multiple methods called. for instance, instead of centering you could ljust and rjust.