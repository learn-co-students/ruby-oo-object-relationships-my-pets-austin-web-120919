class Cat
  # code goes here

  attr_accessor :mood
  attr_reader :name, :owner, :species

  @@all = []

  def initialize(name, owner)
    @name = name
    self.owner= owner
    @mood = "nervous"
    @species = 'cat'
    @@all << self
  end

  def owner= (owner)
    @owner = owner
    owner.give_pet(self)
  end

  def self.all
    @@all
  end

  def self.search_by_name(name)
    self.all.find{|pet| pet.name == name}
  end

  def be_sold
    self.remove_instance_variable(:@owner)
  end

end