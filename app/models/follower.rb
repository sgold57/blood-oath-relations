class Follower
  attr_accessor :name, :age, :life_motto

  @@all = []
  
  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @@all << self
  end

  def self.all
    @@all
  end

  def cults
    BloodOath.all.select{|oath| oath.follower == self}
  end

  def how_many_cults
    cults.size
  end

  def join_cult(cult, initiation_date)
    BloodOath.new(cult, self, initiation_date)
  end

  def self.of_a_certain_age(age)
    all.select {|person| person.age >= age}
  end

  def my_cults_slogans
    cults.map {|membership| membership.cult.slogan}
  end

  def self.most_active
    all.max_by {|person| person.how_many_cults}
  end


end