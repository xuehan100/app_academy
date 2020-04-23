require_relative "code"

class Mastermind
    def initialize(length) 
        @secret_code = Code::random(length)
    end
    
    def print_matches(code)
        puts @secret_code.num_exact_matches(code)
        puts @secret_code.num_near_matches(code)
    end

    def ask_user_for_guess
        puts 'Enter a code'
        code = gets.chomp
        guess = Code::from_string(code)
        print_matches(guess)
        if guess == @secret_code
            return true
        end
        return false
    end

end
