class Cult
  attr_accessor :name, :location, :founding_year, :slogan

  @@all = []
  
  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @@all << self
  end

  def self.all
    @@all
  end

  def recruit_follower(follower, initiation_date)
    BloodOath.new(self, follower, initiation_date)
  end

  def cult_roster
    BloodOath.all.select {|oath| oath.cult == self}
  end

  def cult_population
    cult_roster.size
  end

  def self.find_by_name(name)
    all.find {|cult| cult.name == name}
  end

  def self.find_by_location(location)
    all.find {|cult| cult.location == location}
  end

  def self.find_by_founding_year(founding_year)
    all.find {|cult| cult.founding_year == founding_year}
  end

  def average_age
    total_age = cult_roster.reduce(0){|agg, oath| agg + oath.follower.age}
    total_age / cult_population.to_f
  end

  def my_followers_mottos
    cult_roster.map {|person| person.follower.life_motto}
  end

  def self.least_popular
    all.min {|cult| cult.cult_population}
  end
end