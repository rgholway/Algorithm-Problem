b = [1, 3, 5, 4, 513, 7, 2, 1, 8]
array = b.sort
i = 0
numbers = Hash.new
20.times do
  i += 1
  numbers[i] = 0
end
array.each {|item|
if numbers[item] = item
  numbers[item] = 1
end
}

selected = numbers.key(0)
puts selected
