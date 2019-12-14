class Owner
  attr_reader :name, :species

  @@all = []

  def initialize (name,species = "human")
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
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def pets
    self.dogs + self.cats
  end 
  
  def buy_cat(cat_name)
    Cat.new(cat_name,self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    self.dogs.map{|dog| dog.mood = 'happy'}
  end

  def feed_cats
    self.cats.map{|cat| cat.mood = 'happy'}
  end

  def sell_pets
    self.pets.map do |pet| 
      pet.mood = 'nervous'
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end