module MemoTomato
  module Parser
    class Base
      def initialize(response)
        @response = response
      end
      
      def parse
        @content = Hashie::Mash.new(MultiJson.decode(@response.body))
        parse_content
      end
      
      # This should be implemented in child class
      def parse_content
      end

      def parse_entry(movie)
        unless (movie.posters.detailed =~ /poster_default.gif$/).nil?
          movie.posters.detailed = nil
        end
        
        MemoTomato::Movie.new(
          :id => movie.id,
          :title => movie.title,
          :year => movie.year,
          :mpaa_rating => movie.year,
          :runtime => movie.runtime,
          :release_date => movie.release_dates.theater,
          :synopsis => movie.synopsis,
          :image => movie.posters.detailed,
          :studio => movie.studio,
          :cast =>
            Array(movie.abridged_cast).collect do |actor|
              MemoTomato::Actor.new(
                :name => actor.name,
                :characters => actor.characters
              )
            end,
          :directors =>
            Array(movie.abridged_directors).collect do |director|
              MemoTomato::Director.new(
                :name => director.name
              )
            end,
          :genres => Array(movie.genres)
        )
      end
    end
  end
end
