module MemoTomato
  module Parser
    class SearchMovie < Base
      def parse_content(content)
        parsed_response = MultiJson.decode(content.body)
        parsed_response = Hashie::Mash.new(parsed_response)
        
        # In our case we want the first 30 movies so the request can return a total
        # of more or less than that so we have to check
        movies = []
        count = 0
        if parsed_response.total > 29 
          30.times do |i|
            movies << parse_entry(parsed_response.movies[i])
          end
        else
          parsed_response.total.times do |i|
            movies << parse_entry(parsed_response.movies[i])
          end
        end
        movies
      end

      def parse_entry(movie)
        MemoTomato::Movie.new(
          :id => movie.id,
          :title => movie.title
        )
      end
    end
  end
end
