module MemoTomato
  module Parser
    class Base
      def initialize(content)
        @content = content
      end
      
      def parse
        parse_content @content
      end

      def parse_entry(movie)
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
          :genres =>
            Array(movie.genres).collect do |genre|
              MemoTomato::Genre.new(
                :type => genre
              )
            end
        )
      end
    end
  end
end
