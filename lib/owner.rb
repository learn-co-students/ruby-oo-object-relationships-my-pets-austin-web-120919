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
     "I am a #{@species}."
  end

# Start class methods

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select { |cat|
  cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog|
  dog.owner == self}
  end

  def buy_cat(name)
    new_pet = Cat.new(name,self)
    # binding.pry
  end

  def buy_dog(name)
    new_pet = Dog.new(name,self)
    # binding.pry
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
    # binding.pry
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood =  "happy"
    end
  end

  def sell_pets
    self.cats.each do |cat|
      cat.mood ="nervous"
      cat.owner = nil
    end   
    self.cats.clear
    self.dogs.each do |dog|
      dog.mood ="nervous"
      dog.owner = nil
    end
    self.dogs.clear
  end

    # binding.pry

  def list_pets
    self.cats.each do |cat|
      cat.name
    end
    self.dogs.each do |dog|
      dog.name
    end
    
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."

  end
end