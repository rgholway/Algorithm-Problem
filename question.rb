def solution(a, b)
  n = a.length
  m = b.length
  a = a.sort
  b = b.sort
  i = 0

  for k in 0 .. n - 1
    if i < m - 1 and b[i] < a[k]
      i += 1
    end
    if b.include?(a[k])
      puts a[k]
    end
  end
  puts -1
end

a = [1, 2, 3, 10]
b = [4, 5, 6, 7, 8, 10]

solution(a,b)
