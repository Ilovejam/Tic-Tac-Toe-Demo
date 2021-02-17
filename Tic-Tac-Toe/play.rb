require_relative "board"
class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

board = Board.new

puts "Welcome to Tic Tac Toe little Jamal.. \n Enter your name : "
name1 = gets.chomp

player1 = Player.new(name1,'X')
puts "Hello #{name1}, your symbol is 'X'"
puts "Player 2, what is your name? "
name2 = gets.chomp
player2 = Player.new(name2,'0')
puts "Welcome #{name2}, your symbol is '0'"

active_player = player1

until board.finished
    board.display
    board.move(active_player.name, active_player.symbol)
    if board.win
        board.display
        puts "#{active_player.name} has won"

    elsif
        board.display
        puts "The game has tied"
    
    else
        if active_player == player1
            active_player = player2
        
        else
            active_player = player1

        end

    end

end
