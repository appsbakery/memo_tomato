module MemoTomato
  module Parser
    class SimilarMovies < Base
      def parse_content(content)
        parsed_response = MultiJson.decode(content.body)
        parsed_response = Hashie::Mash.new(parsed_response)
        
        parsed_response.movies.collect do |movie|
          parse_entry(movie)
        end
      end
    end
  end
end
