class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]
  
  def initialize
    @board = 
      [" ", " ", " ", 
       " ", " ", " ", 
       " ", " ", " "]
  end
  
  def display_board
    index = 0
    while index < @board.length-1
      puts "#{@board[index]} | #{@board[index+1]} | #{@board[index+2]}"
      index += 3
    end
  end
  
  def input_to_index(index)
    index.to_i-1
  end
  
  def move(i, token = "X")
    
  end
end

tictac = TicTacToe.new
tictac.display_board