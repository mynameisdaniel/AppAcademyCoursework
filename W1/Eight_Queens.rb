
class Queen

  attr_reader :board, :num_queens, :queens, :visited_positions, :solved

	def initialize
     @board = Array.new(8) { Array.new(8) }
     @visited_positions = []
     @all_positions = []
     @solved = []
     init_all_positions
	end

    def init_all_positions
 	  (0..7).each do |row|
    	(0..7).each do |col|
    	  @all_positions << [row,col]
    	 end
      end
    end

    def deep_dup(obj)
    	new_board = obj.map(&:dup)
    end

    def print_board(board)
      print "\n"
	    board.each do |row|
	      line = ""
    	  row.each do |el| 
		      line += "_" if el.nil?
		      line += "Q" if el == "Q"
			  end
		    puts line
		  end
	    nil
    end
     
    def start
      place_queen(deep_dup(@board), [])
    end

    def find_queens(board)
      # finds all queens on current board and returns an array of their available moves

      queens = []
      (0..7).each do |row|
        (0..7).each do |col|
            queens << [row,col] if board[row][col] == "Q"
        end
      end
      blocked_coords = []
      queens.each do |queen_pos|
        moves(queen_pos).each do |coord|
          blocked_coords << coord unless blocked_coords.include?(coord)
        end
      end
      blocked_coords
    end
    
    def how_many(board)
        board.flatten.compact.count
    end

    def place_queen(board, visited_positions)
        # method takes in a board and array of positions already visited
        print_board(board)
        queens_coords = deep_dup(find_queens(board))
        queens_coords.each do |coord|
          visited_positions << coord unless visited_positions.include?(coord)
          end
  
        available_positions = deep_dup(@all_positions) - deep_dup(visited_positions)
        
        # iterates through each available position, places a queen, then calls function again
        if available_positions.count != 0
          available_positions.each do |spot|
            this_board = deep_dup(board)
            next if visited_positions.include?([spot[0],spot[1]])
            this_board[spot[0]][spot[1]] = "Q"
              vp2 = deep_dup(@all_positions[0..(@all_positions.index([spot[0],spot[1]]))])
              @solved << deep_dup(this_board) if how_many(this_board) == 8
              place_queen(deep_dup(this_board), deep_dup(vp2))
            end
        end
     nil
    end

    def valid?(pos)
    	pos[0].between?(0, 7) && pos[1].between?(0, 7)
    end

    def moves(pos)
      # returns array of all possible moves for a queen given a position
    	directions = [ [0, 1] , [0, -1], [1, 0], [-1, 0],
    				       [1, 1] , [1, -1], [-1, 1], [-1, -1]]
      possible_moves = Array.new
        directions.each do |delta|
    		pos2 = pos.dup
    		while valid?(pos2)
          possible_moves << pos2.dup
    			pos2[0] += delta[0]
    			pos2[1] += delta[1]	
    		end
    	end
    	possible_moves
    end

    def inspect
    end
end
