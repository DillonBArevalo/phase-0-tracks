puts letters = "hello world".split('')
puts letters.class
letters.map! { |letter| letter.next }
puts letters
new_string = letters.join('')
puts new_string