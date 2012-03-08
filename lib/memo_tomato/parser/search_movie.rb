module MemoTomato
  module Parser
    class SearchMovie < Base
      def parse_content(content)
        parsed_response = MultiJson.decode(content.body)
        parsed_response = Hashie::Mash.new(parsed_response)
        
        # In our case we want the first 30 movies
        parsed_response.movies.collect do |movie|
          parse_entry(movie)
        end
      end
    end
  end
end