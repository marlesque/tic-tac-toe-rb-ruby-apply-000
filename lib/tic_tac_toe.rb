# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def play(board)
  drawTable = []
  until (draw?(board) || won?(board))
    
      turn(board)
      
      
      
  end
if won?(board)
    person_winning= winner(board)
    puts "Congratulations #{person_winning}!"
  end  
  if draw?(board)
    puts "Cat's Game!" 
  end
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]]

def won?(board)
   empty = board.all? do |position|
     position == "" || position == " "
   end
   if empty
     return FALSE
   end
   
   
   WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
        break
    end
  end
  return nil
end

def full?(board)
  counter = 0 
  result= TRUE
  while counter<9
   if !position_taken?(board, counter)
     return FALSE
   end
   counter += 1
 end
  return result
 end
 
def draw?(board)
  if full?(board) && (won?(board)==nil)
    return TRUE
  else
    return FALSE
  end
end

def over?(board)
  inprogress = board.any?{|i| i == "" || i == " " || i== nil}
  if inprogress && (won?(board)==nil)
    return FALSE
  end
  
  if (won?(board)!=nil) && !(full?(board))
    return TRUE
  end
  
  if (won?(board)!=nil) || draw?(board) || full?(board)
    return TRUE
  end
end

def winner(board)
  array= won?(board)
  if (won?(board)==nil)
    return nil
  else
    return board[array[0]]
  end
end

def turn_count(board)
  counter = 0
  board.each do |position|
    if position =="X" || position == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  num = turn_count(board)
  if (num % 2 == 1)
    return "O"
  else
    return "X"
  end
end

def valid_move?(board, index)
  if index>8 && index <0
    return FALSE
  end
  if position_taken?(board, index)
    return FALSE
  end
  if !(position_taken?(board, index)) && (index<=8 && index >=0)
    return TRUE
  end
    
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def turn(board)
  
  puts "Please enter 1-9:"
  input = gets.strip
  index_num = input_to_index(input)
  if valid_move?(board, index_num) 
    if (turn_count(board) % 2 ==0)
      move(board, index_num, 'X')
      
    else 
      move(board, index_num, 'O')
      
    end
    display_board(board)
  else
      puts "Please enter 1-9:"
      input = gets.strip
      index_num = input_to_index(input)
    end
end

# code your input_to_index and move method here!
def input_to_index(str)
  if str.to_i >= 0 && str.to_i <=8
    return str.to_i - 1
  end
end

def move(array, index, value)
  array[index]= value
  display_board(array)
end

