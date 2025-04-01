def zip(arr1, arr2)
  arr3 = []
  idx = 0
  while idx < arr1.length
    arr3 << [arr1[element], arr2[element]]
    idx += 1
  end
  arr3
end

p [1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]