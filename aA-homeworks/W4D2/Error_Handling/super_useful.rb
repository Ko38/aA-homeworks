# PHASE 2
def convert_to_int(str)
  begin 
  Integer(str)
  rescue ArgumentError => e
    puts "Something went wrong: #{e.message}"
    return nil
  end
end

#p convert_to_int("a")

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit 
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise StandardError 
  end 
end

def feed_me_a_fruit
  
  begin
    puts "Hello, I am a friendly monster. :)"

    puts "Feed me a fruit! (Enter the name of a fruit:)"
  
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue StandardError => e
    retry if maybe_fruit == "coffee"
    puts "I'm still hungry"
  end
end  

#feed_me_a_fruit

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
    raise ArgumentError, "Not long enough" if yrs_known < 5
    raise ArgumentError, "Please put in a name" if name.length <= 0
    raise ArgumentError, "Please put in your favorite pastime" if fav_pastime.length <= 0
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


