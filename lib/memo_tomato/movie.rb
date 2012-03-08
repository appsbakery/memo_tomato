module MemoTomato
  class Movie < Node
    attr_reader :id
    attr_reader :title
    attr_reader :year
    attr_reader :mpaa_rating
    attr_reader :runtime
    attr_reader :release_date 
    attr_reader :synopsis
    attr_reader :image
    attr_reader :studio

    attr_reader :cast # Array[] Actors
    attr_reader :directors # Array[] Directors
    attr_reader :genres # Array[] Genres
  end
end
