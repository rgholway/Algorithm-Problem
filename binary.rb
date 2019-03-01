def binary_search(a, x)
  sort = a.sort
  n = sort.size
  beg = 0
  end_array = n - 1
  result = -1
  while beg <= end_array
    mid = (beg + end_array) / 2
    if a[mid] <= x
      beg = mid + 1
      result = mid
    elsif
      end_array = mid - 1
    end
  end
 puts sort[result]
end

a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]
x = 7
binary_search(a, x)
