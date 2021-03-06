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
    while index < @board.length
      puts " #{@board[index]} | #{@board[index+1]} | #{@board[index+2]} "
      index += 3
      puts "-----------" if index < @board.length
    end
  end
  
  def input_to_index(input)
    input.to_i-1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] == " " ? false : true
  end
  
  def valid_move?(index)
    if index < 0 || index >= @board.length
      false
    else
      !position_taken?(index)
    end
  end
  
  def turn
    index = 0
    loop do
      puts "Please select a square (1-9):"
      input = gets
      index = input_to_index(input)
      break if valid_move?(index)
    end
    move(index, current_player)
    display_board
  end
  
  def turn_count
    count = 0
    @board.each do |space|
      if space != " "
        count += 1
      end
    end
    count
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]] && @board[combo[0]] != " "
        return combo
      end
    end
    false
  end
  
  def full?
    turn_count == @board.length
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    @board[won?[0]] if won?
  end
  
  def play
    while !over?
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
