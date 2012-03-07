module MemoTomato
  module Parser
    class Base
      def initialize(content)
        @content = content
      end
      
      def parse
        parse_content @content
      end
    end
  end
end
