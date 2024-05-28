class Board
  def initialize
    @board = Array.new(8) { Array.new(8) { Node.new } }
    @possible_moves = [[1, 2], [2, 1], [-1, -2], [-2, -1], [1, -2], [2, -1], [-1, 2], [-2, 1]] 
  end

  def make_moves
    @board.each_with_index do |row, i|
      row.each_with_index do |node, j|
        node.data = [i, j]
        moves = formula(i, j)
        moves.each { |row, column| node.moves << @board[row][column] }
      end
    end
  end

  def formula(i, j)
    array = []
    @possible_moves.each do |a, b|
      u = a + i
      v = b + j
      array << [u, v] if u.between?(0, 7) && v.between?(0, 7)
    end
    array
  end

  def shortest_path(source)
    a,b = source
    root = @board[a][b]
    queue = [root]
    until queue.none?
      node = queue.shift

      node.moves.each do |child|
        next unless child.visited == false
     
        child.visited = true
        queue.push(child)
        child.parent = node
      end
    end
  end

  def show_path(source, destination)
    u, v = destination
    a, b = source
    souce = @board[a][b]
    node = @board[u][v]
    array = []
    until node == souce
      array << node.data
      node = node.parent
    end
    array.push(souce.data).reverse
  end
end

class Node
  attr_accessor :data, :moves, :visited, :parent
  
  def initialize
    @data = nil
    @moves = []
    @parent = nil
    @visited = false
  end
end