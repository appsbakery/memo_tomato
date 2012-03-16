module MemoTomato
  module Parser
    class SearchMovie < Base
      def parse_content
        # In our case we want the first 30 movies
        @content.movies.collect do |movie|
          parse_entry(movie)
        end
      end
    end
  end
end
