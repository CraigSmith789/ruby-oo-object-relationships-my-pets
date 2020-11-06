class Owner
  attr_reader :name, :species
  @@all =[]

  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
    

  end
  def say_species
     "I am a #{@species}." 

  end
  def self.all 
    @@all 
  end

  def self.count
    @@all.length 
  end
  def self.reset_all
    @@all.clear
  end
  def cats 
    Cat.all.select do |cat|
      cat.owner == self
    end
  end
  def dogs 
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end 

  def walk_dogs
    self.dogs.select do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.select do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.dogs.select do |dog|
      dog.mood = "nervous"
      dog.owner = nil
      end
      self.cats.select do |cat|
        cat.mood = "nervous" 
        cat.owner = nil
      end
      cats.clear
      dogs.clear 
  end

    def list_pets
      "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
    end
end