def initial_board
  black_pieces = [["r", "n", "b", "q", "k", "b", "n", "r"], ["p", "p", "p", "p", "p", "p", "p", "p"]]
  white_pieces = [["P", "P", "P", "P", "P", "P", "P", "P"], ["R", "N", "B", "Q", "K", "B", "N", "R"]]
  black_pieces + [[" "] * 8, [" "] * 8, [" "] * 8, [" "] * 8] + white_pieces
end

def display_board(game_board)
  puts "    a   b   c   d   e   f   g   h"
  row_counter = 1
  game_board.each do |row|
    print row_counter
    row_counter += 1
    row.each do |cell|
      print " | " + cell + ""
    end
    puts " |"
  end
end

def ask_for_move(game_board)
  print "Which piece do you want to move? "
  piece_location = gets.chomp
  print "Where to? "
  destination = gets.chomp
  piece_coords = get_row_and_col(piece_location)
  destination_coords = get_row_and_col(destination)
  piece = get_piece(game_board, piece_coords)
  if validate_piece(piece) && validate_move(piece, piece_coords, destination_coords)
    return piece_coords, destination_coords
  else
    return ask_for_move(game_board)
  end
end

def get_piece(game_board, piece_coords)
  game_board[piece_coords[0]][piece_coords[1]]
end

def validate_piece(piece)
  if piece == " "
    puts "There's no piece there!"
    false
  elsif $white_to_move != (piece.upcase == piece)
    puts "That's not your piece!"
    false
  else
    true
  end
end

def validate_move(piece, piece_coords, destination_coords)
  case piece.upcase
  when "R"
  when "N"
  when "B"
  when "Q"
  when "K"
  when "P"
  end
end

def make_move(piece_coords, destination_coords, game_board)
  piece = get_piece(game_board, piece_coords)
  game_board[piece_coords[0]][piece_coords[1]] = " "
  game_board[destination_coords[0]][destination_coords[1]] = piece
  game_board
end

def get_row_and_col(location)
  row = location[1].to_i - 1
  col = location[0].ord - 97
  return row, col
end

def play
  $white_to_move = true
  game_over = false
  game_board = initial_board
  while (!game_over)
    display_board(game_board)
    piece_coords, destination_coords = ask_for_move(game_board)
    game_board = make_move(piece_coords, destination_coords, game_board)
  end
end

play