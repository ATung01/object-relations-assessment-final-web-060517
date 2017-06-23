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
