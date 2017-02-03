def int_search(arr, int)
  i=0
  arr.each do |entry|
    if entry == int
      return i
    end
    i+=1
  end
  return nil
end

#p int_search([1,2,3,4,5], 2)

def fib(int)

  if int == 1
    return [0]
  end
  
  fibb = [0,1]
  i=2
  
  until i >= int
    fibb << (fibb[-1]+fibb[-2])
    i+=1
  end

  fibb
end

#p 218922995834555169026 == fib(100)[-1]
#p fib(10)

=begin
Pseudocode for bubble sort!
input list as an argument
create t/f switch checker and set it to true (to see if it's all in order when we loop)
loop while switch checker is true:
  set switch checker to false
  loop through each item
    iterate through the list excepting the last item and switch pairs if they are in the wrong order
    if we switch something, set switch checker to true
return new list
=end

def bubble_sort(arr)
  checker = true
  while checker
    checker = false

    0.upto(arr.length - 2) do |i|

      if arr[i] > arr[i+1]
        placeholder = arr[i]
        arr[i] = arr[i+1]
        arr[i+1]=placeholder
        checker = true
      end

    end
  end
  return arr
end


#p bubble_sort(["a", "b","1","a","r","R","e"])