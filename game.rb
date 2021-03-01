require "./players"
require "./questions"

class Game
  def initialize()
    @player1 = Players.new("Player 1")
    @player2 = Players.new("Player 2")
    @question = Questions.new
    @current_player = @player1
  end

  def play
    turn = 1
    while @player1.is_alive? && @player2.is_alive?
      numbers = @question.ask()

      puts "#{@current_player.name}: What does #{numbers[0]} plus #{numbers[1]} equal?"
      answer_input = gets.chomp.to_i
      if @question.is_correct?(answer_input)
        puts "YES! You are correct."
      else
        puts "Seriously? No!"
        @current_player.wrong
      end

      if game_over?()
        final_score()
        puts "---- GAME OVER ---"
        break
      end

      turn == 1 ? @current_player = @player2 : @current_player = @player1
      turn == 1 ? turn = 2 : turn = 1
      current_score()

      puts "---- NEW TURN ----"
    end
  end

  def current_score
    puts "P1: #{@player1.lives}/3 vs. P2: #{@player2.lives}/3"
  end

  def game_over?
    @player1.lives <= 0 || @player2.lives <= 0
  end

  # def final_score
  #   if !@player1.is_alive?
  #     winner(@player2)
  #   elsif !@player2.is_alive?
  #     winner(@player1)
  #   end
  # end

  def final_score
    @player1.is_alive? ? winner(@player1) : winner(@player2)
  end

  def winner(player)
    puts "#{player.name} wins with a score of #{player.lives}/3"
  end
end
