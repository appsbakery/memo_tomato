module MemoTomato
  class Client
    attr_reader :params
    
    def initialize(options)
      @params = { :apikey => options[:apikey] }
    end
    
    def search(query)
      content = get('movies', { :q => query })
      parser = MemoTomato::Parser::SearchMovie.new content
      parser.parse
    end    
    
    def movie_info(id)
      content = get("movies/#{id}")
      parser = MemoTomato::Parser::MovieInfo.new content
      parser.parse
    end

    def similar_movies(id)
      content = get("movies/#{id}/similar")
      parser = MemoTomato::Parser::SimilarMovies.new content
      parser.parse
    end
    private
    def get(path, params = {})
      HTTPClient.get build_endpoint(path), build_params(params)
    end
    
    def build_params(params = {})
      @params.merge(params)
    end
    
    def build_endpoint(path)
      File.join(MemoTomato::ROOT_URL, "#{path}.json")
    end
  end
end
