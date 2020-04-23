class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  #pay attention
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    #pay attention 
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if attempted_chars.include?(char)
      return true
    else
      return false
    end
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index do |ele, i|
      if ele == char
        indices << i 
      end
    end
    indices
  end

  def fill_indices(char, indices)
    indices.each {|idx| @guess_word[idx] = char}
  end

  def try_guess(char)
    if already_attempted?(char)
      puts "that has already been attempted"
      return false
    else
      @attempted_chars << char
      indices = get_matching_indices(char)
      if indices.length == 0
        @remaining_incorrect_guesses -= 1
      else
        fill_indices(char, indices)
      end
      return true
    end
  end

  def ask_user_for_guess
    puts 'Enter a char:'
    char = gets.chomp
    try_guess(char)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts 'WIN'
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts 'LOSE'
      return true
    else
      return false
    end
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    else
      return false
    end
  end
end
