def step(start_value, end_value, step)
  current_value = start_value
  all_values = []
  while current_value <= end_value
    all_values << current_value
    yield(current_value)
    current_value += step
  end
  all_values # returning an array of all values seems like a good idea?
end

step(1, 10, 3) { |value| puts "value = #{value}" }