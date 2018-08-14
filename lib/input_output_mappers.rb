def map_exercises_to_knapsack_problem(exercises)
  exercises.map do |exercise|
    {
      'weight' => exercise['average_span'],
      'value' => exercise['average_calorie_consumption']
    }
  end
end

def map_picked_items_to_result(picked_items, exercises)
  packed_items = exercises.each_with_index.map  do |exercise, i|
    exercise if picked_items.include? i
  end.compact
  packed_value = packed_items.sum{ |i| i["average_calorie_consumption"] }

  [
    packed_value,
    packed_items
  ]
end
