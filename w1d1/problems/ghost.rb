class GhostGame
  MAX_LOSS_COUNT = 5
  ALPHABET = ("a".."z").to_a
def initialize(*players)
  @players = players
  @losses = {}
  @dict_hash = Hash.new() {|hash, key| hash[key]=[]}
  File.open("dictionary.txt").each_line do |word|
    @dict_hash[word.slice(0)] << word.chomp
  end

  players.each { |player| losses[player] = 0 }
end

def run
  play_round until game_over?
  puts "#{winner} wins!"
end

private
attr_reader :fragment, :dict_hash, :losses, :players

def play_round
  @fragment = ""
  welcome

    until rount_over?
      take_turn(current_player)
      next_player!
    end
    update_standings
end

def update_standings
  puts "#{previous_player} spelled #{fragment}."
  puts "#{previous_player} gets a letter!"

  losses[previous_player] += 1
  if loses[previous_player] == MAX_LOSS_COUNT
    puts "#{previous_player} has been eliminated!"
  end
  sleep(2)
end

def next_player!
  players.rotate! ###########
  players.rotate! until losses[current_player] < MAX_LOSS_COUNT
end

def take_turn(player)
  system("clear")
  puts "It's #{players}'s turn."
  letter = nil

  until letter && valid_play(letter) #########
    letter = player.guess(fragment)
    player.alert_invalid_guess(letter) unless vlid_play?(letter)
  end

  add_letter(letter)
end

def rount_over?
  is_word?(fragment) ##############
end

def valid_play(letter)
  return false unless ALPHABET.include?(letter)

  new_fragment = fragment + letter
   @dict_hash[fragment.slice(0)].any? { |word| word.start_with?(new_fragment)}
end
def is_word?(fragment)
  dict_hash[fragment.slice(0)].include?(fragment)
end

def welcome
  system("clear")
  puts "Let's play a round of Ghost!"
  display_standings ##################
end



end
Game.new
 p @dic_hash["z"]



class Player
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def guess(fragment)
    prompt(fragment)
    gets.chomp.downcase
  end

  def inspect
    "HumanPlayer: #{name}"
  end

  def to_s
    name
  end

  def alert_invalid_guess(str)
    puts "#{str} is not a valid move!"
    puts "Must be a letter."
    puts "A new word must be posible from the new fragment"
  end
def prompt(fragment)
  puts "The current fragment is #{fragment}."
  print "Add a letter:"
end

end
