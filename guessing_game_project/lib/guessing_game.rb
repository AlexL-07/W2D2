class GuessingGame
    def initialize(min, max)
        @min = min 
        @max = max
        @secret_num = rand(min..max)
        @num_attempts = 0 
        @game_over = false
    end

    def num_attempts
        return @num_attempts
    end

    def game_over?
        return @game_over
    end

    def check_num(n)
        if n > @secret_num
            @num_attempts += 1
            print "too big"
        elsif n < @secret_num
            @num_attempts += 1
            print "too small"
        else
            @game_over = true
            print "you win"
        end
    end

    def ask_user
        p "enter a number"

        input = gets.chomp.to_i
        check_num(input)
    end
end
