require 'bundler'
Bundler.setup

# require gems
require 'sinatra'

# require app's files
require_relative 'lib/knapsack_solver'
require_relative 'lib/input_output_mappers'

set :bind, '0.0.0.0'

# the main entrypoint
# run 'ruby app.rb' and visit localhost:4567 to see the result
post '/' do
  data = JSON(request.body.read)
  capacity = data['time']
  items = map_exercises_to_knapsack_problem(data['exercises'])
  picked_items = KnapsackSolver.exec(capacity, items)

  map_picked_items_to_result(picked_items, data['exercises']).to_json
rescue JSON::ParserError, InvalidInputError
  halt 422, { message: 'malformed body' }.to_json
end
