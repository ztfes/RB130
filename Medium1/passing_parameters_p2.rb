def categorize(arr)
  yield(arr) if block_given?
end

raptors = categorize(%w(raven finch hawk eagle)) do |_, _, *birds|
  birds
end

p raptors # ["hawk", "eagle"]


