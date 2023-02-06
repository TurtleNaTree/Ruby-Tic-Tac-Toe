class TicTacToe
    private
    attr_reader :current_player, :game_board

    public
    def initialize
        @current_player = "Player 1"
        @game_board = Array.new(9)
        
    end

    def display_board
        puts "\t\t#{current_player}'s Turn!"
        puts "__________________________________________________"
        game_board().each_with_index do |game_space, index|
            unless (index + 1) % 3 == 0
                print "\t#{get_game_space(game_space, index)} \t |"
            else
                puts "\t#{get_game_space(game_space, index)} \n __________________________________________________"
            end
        end
    end

    def check_game_space(game_space, index)
        game_space == nil ? index + 1 : game_space
    end
    
    def get_game_space(game_space, index)
        game_space == nil ? index + 1 : game_space
    end

    def info
        puts "The current player is #{current_player} the game board is #{game_board}}"
    end

    def place_piece
        spot_selected = false
        player_choice = ""
        until spot_selected == true
            puts "#{current_player} enter a number (1 - 9) to choose a spot."
            player_choice = gets.chomp
            spot_selected = true if player_choice
        end
        game_board[player_choice.to_i - 1] = "x"

        

    end
    def check_for_horizontal_win
        x = 0
        @game_board[2] = "x"
        @game_board[4] = "o"
        while x < 7
            row_to_check = game_board.slice(x,3)
            puts "current row is #{row_to_check}"
            x += 3
        end

    end
end

lets_play = TicTacToe.new
lets_play.display_board()
lets_play.check_for_horizontal_win
lets_play.place_piece
lets_play.display_board()
puts [1, 2, 3, 4, 5, 6, 7, 8, 9] - [1, 3, 5, 7, 9]