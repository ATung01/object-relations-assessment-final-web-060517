# Please copy/paste all three classes into this file to submit your solution!
class Movie
  attr_accessor :title

  @@all = []


  def initialize(title)
    self.title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    @@all.find do |movie_instance|
      movie_instance.title == title
    end
  end

  def ratings
    Rating.all.select do |rating_instance|
      rating_instance.movie == self
    end
  end

  def viewers
    self.ratings.map do |rating|
      rating.viewer
    end
  end

  def average_rating
    arr_of_ratings= self.ratings.map {|rating| rating.score}
    arr_of_ratings.inject{ |sum, el| sum + el }.to_f / arr_of_ratings.size

  end

end

class Rating
  attr_accessor :score
  attr_reader :viewer, :movie

  @@all = []

  def initialize(score, viewer, movie)
    @score = score
    @viewer = viewer
    @movie = movie
    @@all << self
  end

  def self.all
    @@all
  end

end

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
