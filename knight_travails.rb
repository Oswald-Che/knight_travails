require_relative 'board'

def knight_moves(source, destination)
  board = Board.new
  board.make_moves
  board.shortest_path(source)
  board.show_path(source, destination)
end

puts "#{knight_moves([3,3],[4,3])}"