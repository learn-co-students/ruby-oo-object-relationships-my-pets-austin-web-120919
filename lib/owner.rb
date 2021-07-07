require 'pry'
class Owner

  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species 
    p "I am a #{@species}."
  end

  def self.all 
    @@all 
  end

  def self.count 
    self.all.count
  end

  def self.reset_all
    self.all.clear
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

  def buy_cat(cat_name)
    Cat.new(cat_name,self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name,self)
  end

  def walk_dogs
    Dog.all.each do |dog|
      dog.mood = "happy"
    end
  end
  
  def feed_cats
    Cat.all.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.cats.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
    self.dogs.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    self.dogs.each do |dog|
      puts dog.name
      end
    self.cats.each do |cat|
    puts cat.name
    end
    p "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."

  end
end