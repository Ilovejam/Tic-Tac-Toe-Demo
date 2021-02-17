class Board

    def initialize
      @board = {
        :h1 => '1', :a1 => '-', :b1 => '-', :c1 => '-',
        :h2 => '2', :a2 => '-', :b2 => '-', :c2 => '-',
        :h3 => '3', :a3 => '-', :b3 => '-', :c3 => '-',
        :h0 => '', :ha => 'a', :hb => 'b', :hc => 'c',
      }
    end
  
    def display
      puts (@board[:h1] + ' ' + @board[:a1] + ' ' + @board[:b1] + ' ' + @board[:c1])
      puts (@board[:h2] + ' ' + @board[:a2] + ' ' + @board[:b2] + ' ' + @board[:c2])
      puts (@board[:h3] + ' ' + @board[:a3] + ' ' + @board[:b3] + ' ' + @board[:c3])
      puts (@board[:h0] + ' ' + @board[:ha] + ' ' + @board[:hb] + ' ' + @board[:hc])
  
    end
  
    def move(player, sym)
  
      valid = false
      while valid == false
        puts "#{player}, please choose a square"
        position = gets.chomp.downcase
        if position == 'exit'
          puts 'Exiting game.'
          return exit
        elsif not position.match /[abc][123]/
          puts "Please return a valid move"
        elsif @board[position.to_sym] != '-'
          puts "That square is already taken"
        else
          valid = true
          @board[position.to_sym] = symbol
        end
      end
    end
  
    def win
      if (@board[:a1] == @board[:a2] && @board[:a2] == @board[:a3] && @board[:a3] != '-' ||
          @board[:b1] == @board[:b2] && @board[:b2] == @board[:b3] && @board[:b3] != '-' ||
          @board[:c1] == @board[:c2] && @board[:c2] == @board[:c3] && @board[:c3] != '-' ||
          @board[:a1] == @board[:b1] && @board[:b1] == @board[:c1] && @board[:a3] != '-' ||
          @board[:a2] == @board[:b2] && @board[:b2] == @board[:c2] && @board[:a2] != '-' ||
          @board[:a3] == @board[:b3] && @board[:b3] == @board[:c3] && @board[:a3] != '-' ||
          @board[:a1] == @board[:b2] && @board[:b2] == @board[:c3] && @board[:c3] != '-' ||
          @board[:c1] == @board[:b2] && @board[:a3] == @board[:b2] && @board[:a3] != '-')
          return true
      end
    end
  
      def tied
        @board.each do |key, value|
          if value == '-'
            return false
          end
        end
        return true unless win
        return false
      end
  
      def finished
        tied || win
      end
  
    end