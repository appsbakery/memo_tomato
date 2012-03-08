module MemoTomato
  module Parser
    class MovieInfo < Base
      def parse_content(content)
        parsed_response = MultiJson.decode(content.body)
        parsed_response = Hashie::Mash.new(parsed_response)
        
        parse_entry(parsed_response)
      end

    end
  end
end
