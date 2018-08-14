require 'spec_helper'

describe KnapsackSolver do
  let(:subject) { described_class.exec(capacity, items) }

  context 'with valid params' do
    let(:capacity) { 5 }
    let(:items) do
      [
        { "weight" => 3, "value" => 100 },
        { "weight" => 2, "value" => 20 },
        { "weight" => 4, "value" => 60 },
        { "weight" => 1, "value" => 40 }
      ]
    end


    it 'returns indexes of selected items' do
      expect(subject).to eq [3, 0]
    end
  end

  context 'with invalid params' do
    let(:capacity) { 5 }
    let(:items) do
      [
        { "id" => 1, "average_span" => 3, "average_calorie_consumption" => 100 },
        { "id" => 2, "average_span" => 2, "average_calorie_consumption" => 20 },
        { "id" => 3, "average_span" => 4, "average_calorie_consumption" => 60 },
        { "id" => 4, "average_span" => 1, "average_calorie_consumption" => 40 }
      ]
    end

    it 'returns indexes of selected items' do
      expect{ subject }.to raise_error InvalidInputError
    end
  end
end
