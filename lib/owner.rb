require 'pry'
class Owner
  # code goes here

  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @pets = []
  end

  def say_species
    "I am a human."
  end

  def give_pet(pet)
    @pets << pet
  end

  def pets
    @pets
  end

  def buy_cat(name)
    #Cat.search_by_name(name) ? Cat.search_by_name(name).owner = self : Cat.new(name, self).owner = self
    Cat.new(name, self)
  end

  def buy_dog(name)
   # binding.pry
   # Dog.search_by_name(name) ? Dog.search_by_name(name).owner = self : Dog.new(name, self).owner = self
   Dog.new(name, self)
  end

  def cats
    self.find_pet_by_race('cat')
  end

  def dogs
    #binding.pry
    self.find_pet_by_race('dog')
  end

  def find_pet_by_race(race)
    self.pets.find_all{|pet| pet.species == race}
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def walk_dogs
    self.find_pet_by_race('dog').each{|dog| dog.mood = 'happy'}
  end

  def feed_cats
    self.find_pet_by_race('cat').each{|cat| cat.mood = 'happy'}

  end

  def sell_pets
    self.pets.each{|pet| pet.mood = 'nervous'}
    self.pets.each{|pet| pet.be_sold}
    self.pets.clear
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end


end