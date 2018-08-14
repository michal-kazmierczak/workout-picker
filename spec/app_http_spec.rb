require 'spec_helper'
require 'rack/test'

describe "app's http layer" do
  include Rack::Test::Methods
  let(:app) { Sinatra::Application }
  let(:sample_params) do
    {
      "time" => 30,
      "exercises" => [
        {
          "id" => "404c1873-96e5-4767-899a-c28697b4ccd4",
          "name" => "Squats",
          "average_span" => 20,
          "average_calorie_consumption" => 120
        },
        {
          "id" => "075fe124-5b39-4276-b0ac-de4fd5b38f6f",
          "name" => "Arm curls",
          "average_span" => 10,
          "average_calorie_consumption" => 25
        },
        {
          "id" => "2085747a-eee5-445a-85fc-92da51709a41",
          "name" => "Plank",
          "average_span" => 2,
          "average_calorie_consumption" => 10
        },
        {
          "id" => "81fd3a46-e736-4498-9094-f5d7730d1409",
          "name" => "Jumping jacks",
          "average_span" => 10,
          "average_calorie_consumption" => 35
        }
      ]
    }
  end

  context 'with params' do
    it 'responds with success' do
      post '/', sample_params.to_json

      expect(last_response.status).to eq 200
      expect(JSON(last_response.body)).to be_an Array
    end
  end

  context 'without params' do
    it 'responds with 422 error' do
      post '/'

      expect(last_response.status).to eq 422
      expect(JSON(last_response.body)).to be_a Hash
    end
  end
end
