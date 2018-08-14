require 'bundler'
Bundler.setup

# require gems
require 'sinatra'

# require app's files
# the main entrypoint
# run 'ruby app.rb' and visit localhost:4567 to see the result
post '/' do
  data = JSON(request.body.read)
end
