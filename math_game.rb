class Game
    def initialize(player1_name, player2_name)
      @player1 = Player.new(player1_name)
      @player2 = Player.new(player2_name)
      @current_player = @player1
    end
  
    def start
      puts "----- Game Started -----"
      while !game_over?
        puts "\n"
        puts "----- New Turn -----"
        puts "\n"
        generate_question
        display_scores
        switch_turns
      end
      puts "\n"
      puts "----- Game Over -----"
      puts "#{winner.name} wins with a score of #{winner.lives}/3"
      puts "Goodbye!"
    end
  
    private
  
    def generate_question
      @num1 = rand(1..20)
      @num2 = rand(1..20)
      @answer = @num1 + @num2
      puts "#{current_player.name}, what is the sum of #{@num1} and #{@num2}?"
      print "> "
      player_answer = gets.chomp.to_i
      check_answer(player_answer)
    end
  
    def check_answer(player_answer)
      if player_answer == @answer
        puts "Correct answer, well done!"
      else
        puts "Incorrect answer, you lose a life!"
        current_player.lose_life
      end
    end
  
    def display_scores
      puts "Scores:"
      puts "#{player1.name}: #{player1.lives}/3 lives"
      puts "#{player2.name}: #{player2.lives}/3 lives"
    end
  
    def switch_turns
      @current_player = (@current_player == player1) ? player2 : player1
    end
  
    def game_over?
      player1.dead? || player2.dead?
    end
  
    def winner
      player1.dead? ? player2 : player1
    end
  
    attr_reader :player1, :player2, :current_player
  end
  
  class Player
    attr_reader :name, :lives
  
    def initialize(name)
      @name = name
      @lives = 3
    end
  
    def lose_life
      @lives -= 1
    end
  
    def dead?
      @lives <= 0
    end
  end
  
  # Main Program
  
  puts "Welcome to the 2-Player Math Game!"
  puts "Player 1, please enter your name:"
  print "> "
  player1_name = gets.chomp
  puts "Player 2, please enter your name:"
  print "> "
  player2_name = gets.chomp
  
  game = Game.new(player1_name, player2_name)
  game.start