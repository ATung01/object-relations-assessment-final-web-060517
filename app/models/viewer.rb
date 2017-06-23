class Viewer
  attr_accessor :first_name, :last_name

  @@all = []

  def self.all
    @@all
  end

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.find_by_name(name)
    @@all.find do |viewer_instance|
      viewer_instance.full_name == name
    end
  end

  def create_rating(score, movie)
    Rating.new(score, self, movie)
  end

end
