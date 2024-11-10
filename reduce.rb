# def reduce(array, acc = 0)
#   counter = 0

#   while counter < array.size
#     current_element = array[counter]
#     acc = yield(acc, current_element)
#     counter += 1
#   end

#   acc
# end

# array = [1, 2, 3, 4, 5]

# p reduce(array) { |acc, num| acc + num }                    # => 15
# p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

def reduce(array, default = nil)
  counter = 0
  #accumulator = default
  if default.nil?
    accumulator = array[0]
    counter = 1
  else
    accumulator = default
  end

  while counter < array.size
    current_element = array[counter]
    accumulator = yield(accumulator, current_element)
    counter += 1
  end

  accumulator
end

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
p reduce([1, 2, 3, 4, 5]) { |acc, num| acc + num }                    # => 15
p reduce([1, 2, 3, 4, 5], 10) { |acc, num| acc + num }                # => 25