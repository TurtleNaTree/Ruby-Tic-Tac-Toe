class TicTacToe
    private
    attr_reader :current_player, :game_board, :player1_score, :player2_score

    public
    def initialize
        @current_player = "Player 1"
        @game_board = Array.new(9)
        @player1_score = 0
        @player2_score = 0
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

    def clear_board
        game_board.fill(nil)
    end

    def check_player_choice(player_choice)
        if (player_choice > 0) && (player_choice < 10) ? true : false
            game_board[player_choice - 1] == nil ? true : false
        end
    end

    def get_game_space(game_space, index)
        game_space == nil ? index + 1 : game_space
    end

    def info
        puts "The current player is #{current_player} the game board is #{game_board}}"
    end

    def switch_player
        current_player == "Player 1" ? @current_player = "Player 2" : @current_player = "Player 1"
    end

    def place_piece
        spot_selected = false
        player_choice = ""
        until spot_selected == true
            puts "#{current_player} enter a number (1 - 9) to choose a spot."
            player_choice = gets.chomp.to_i
            spot_selected = true if check_player_choice(player_choice)
        end

        player_choice -= 1

        case current_player
            when "Player 1"
                game_board[player_choice] = "x"
                check_for_cross_win
                check_for_horizontal_win
                check_for_vertical_win
                switch_player
            when "Player 2"
                game_board[player_choice] = "0"
                check_for_cross_win
                check_for_horizontal_win
                check_for_vertical_win
                switch_player
            else
                puts "Something went wrong in place_piece"
        end
        
        game_draw unless check_for_draw

    end

    def check_for_draw
        game_board.any?{ |game_space| game_space == nil }
    end

    def check_for_horizontal_win
        x = 0
        while x < 7
            row_to_check = game_board.slice(x,3)
            #puts "current row is #{row_to_check}"
            case current_player
                when "Player 1"
                    if row_to_check.all?("x")
                        game_win
                        break  
                    end
                when "Player 2"
                    if row_to_check.all?("0")
                        game_win 
                        break
                    end
                else
                    puts "Something went wrong in check_for_horizontal_win"
            end
            x += 3
        end

    end

    def check_for_vertical_win
        vertical_row = 0
        while vertical_row < 3
            columns_to_check = []
            columns_to_check.push(game_board[vertical_row], game_board[vertical_row + 3], game_board[vertical_row + 6])
            #puts "current col is #{columns_to_check}"
            case current_player
            when "Player 1"
                if columns_to_check.all?("x")
                    game_win
                    break
                end 
            when "Player 2"
                if columns_to_check.all?("0")
                    game_win
                    break
                end
            else
                puts "Something went wrong in check_for_vertical_win"
            end
            vertical_row += 1
        end
    end

    def check_for_cross_win
        first_cross_to_check, second_cross_to_check = []
        first_cross_to_check = [game_board[0], game_board[4], game_board[8]]
        second_cross_to_check = [game_board[2], game_board[4], game_board[7]]
        case current_player
            when "Player 1"
                if first_cross_to_check.all?("x") || second_cross_to_check.all?("x")
                    game_win  
                end 
            when "Player 2"
                if first_cross_to_check.all?("0") || second_cross_to_check.all?("0")
                    game_win
                end
            else
                puts "Something went wrong in check_for_vertical_win"
        end
    end

    def game_win
        case current_player
            when "Player 1"
                @player1_score += 1
            when "Player 2"
                @player2_score += 1
        end
        puts "#{current_player} Wins!!!"
        display_scores
        clear_board
    end

    def game_draw
        puts "\t\tDRAW!!!\n\t\tPlay again!"
        display_scores
        clear_board
    end

    def display_scores
        puts "Player 1 has #{player1_score} wins"
        puts "Player 2 has #{player2_score} wins"
    end

    def play_game
        puts "\t\tTic Tac Toe!!!\n\t\tFirst to 3 wins!!!"

        until player1_score == 3 || player2_score == 3
            display_board
            place_piece
        end

    end

end

lets_play = TicTacToe.new
lets_play.play_game
#lets_play.check_for_vertical_win
#lets_play.check_for_horizontal_win
#lets_play.check_for_cross_win
#lets_play.place_piece
#lets_play.display_board()
#puts [1, 2, 3, 4, 5, 6, 7, 8, 9] - [1, 3, 5, 7, 9]