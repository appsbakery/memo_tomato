module MemoTomato
  module Parser
    class UpcomingMovies < Base
      def parse_content
        @content.movies.collect do |movie|
          parse_entry(movie)
        end
      end
    end
  end
end
