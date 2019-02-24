b = [1, 3, 5, 4, 513, 7, 2, 1, 8]
i = 0
x = b.size + 1
numbers = Hash.new

x.times do
  i += 1
  numbers[i] = 0
end

b.each {|item|
if numbers[item] = item
  numbers[item] = 1
end
}

selected = numbers.key(0)
puts selected
