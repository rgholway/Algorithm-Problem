def solution(a)
  array = a.sort
  i = 0
  array.each { |item|
  i += 1
  if !array.include?(i)
    puts i
  elsif !array.include?(i + 1)
    puts i + 1
  end
  }
end
