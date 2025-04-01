items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# gather(items) do | *produce, grain |
#   puts produce.join(", ")
#   puts grain
# end

gather(items) do | fruit, *vegetables, grain |
  puts fruit
  puts vegetables.join(", ")
  puts grain
end

# gather(items) do | fruit, *non_fruits|
#   puts fruit
#   puts non_fruits.join(", ")
# end

# gather(items) do | item1, item2, item3, item4 |
#   puts "#{item1} #{item2}, #{item3}, and #{item4}"
# end