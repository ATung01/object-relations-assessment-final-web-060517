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
