module MemoTomato
  class Client
    attr_reader :params
    
    def initialize(options)
      @params = { :key => options[:key] }
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
