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
            unless check_game_space(game_space, index) % 3 == 0
                print "\t#{check_game_space(game_space, index)} \t |"
            else
                puts "\t#{check_game_space(game_space, index)} \n __________________________________________________"
            end
        end
    end

    def check_game_space(game_space, index)
        game_space == nil ? index + 1 : game_space
    end

    def info
        puts "The current player is #{current_player} the game board is #{game_board}}"
    end

end

lets_play = TicTacToe.new
lets_play.display_board()