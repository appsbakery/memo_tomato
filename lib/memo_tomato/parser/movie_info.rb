module MemoTomato
  module Parser
    class MovieInfo < Base
      def parse_content
        parse_entry(@content)
      end
    end
  end
end
