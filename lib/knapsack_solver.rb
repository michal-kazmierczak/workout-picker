class InvalidInputError < StandardError; end

class KnapsackSolver
  class << self
    def exec(capacity, items)
      matrix = get_filled_matrix(capacity, items)
      pick_items(capacity, matrix, items)
    end
    
    private
    
    def get_filled_matrix(capacity, items)
      matrix = []
      # fill edges with zeros
      (0..items.size).each do |i|
        matrix[i] = []
        (0..capacity).each do |w|
          matrix[i][w] = 0 if w == 0 || i == 0
        end
      end

      (1..items.size).each do |i|
        (1..capacity).each do |w|
          matrix[i][w] = 
            if items[i - 1]['weight'] > w
              matrix[i - 1][w]
            else
              [
                matrix[i - 1][w] || 0,
                items[i - 1]['value'] +
                  matrix[i - 1][w - items[i - 1]['weight']]
              ].max
            end
        end
      end

      matrix
    rescue NoMethodError
      # this is most likely due to invalid input, not very accurate thought
      fail InvalidInputError
    end

    def pick_items(capacity, matrix, items)
      i = matrix.size - 1
      w = capacity
      picked_items = []

      while i > 0 && w > 0 do
        if matrix[i][w] != matrix[i - 1][w]
          picked_items << i - 1
          w -= items[i - 1]['weight']
        end
        i -= 1
      end

      picked_items
    end
  end
end
