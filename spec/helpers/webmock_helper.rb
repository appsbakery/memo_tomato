require 'webmock/rspec'

module WebMockHelper
  
  # Mock http request with webmock
  #
  # @param [Symbol] method http method
  # @param [String] path endpoint path
  # @param [String] response_file json response file name/path
  # @param [Hash] options optional options params
  def mock_api(method, path, response_file, options = {})
    stub_request(method, endpoint_for(path)).with(
      request_for(method, options)
    ).to_return(
      response_for(response_file, options)
    )
    
    yield
  end
  
  # Load json response file and return its content
  #
  # @param [String] response_file json response file name/path
  # @return [String]
  def load_json(response_file)
    File.new(File.join(File.dirname(__FILE__), '../mock_json', "#{response_file}.json"))
  end

  private
  
  # Get final url for specific endpoint
  #
  # @param [String] path is the endpoint path ex: `showinfo`
  # @return [String] the formatted endpoint, if anonymize is enabled prefixed with anonymous
  def endpoint_for(path)
    File.join(MemoTomato::ROOT_URL, "#{path}.json")
  end
  
  # Prepare request params for HTTPClient
  #
  # @param [Symbol] http method
  # @param [Hash] options like params, etc
  # @return [Hash] formatted http request hash
  def request_for(method, options = {})
    request = {}
    if options[:params]
      case method
      when :post, :put
        request[:body] = options[:params]
      else
        request[:query] = options[:params]
      end
    end
    request
  end
  
  # Build response hash for HTTPClient
  #
  # @param [String] response_file json response file name/path
  # @param [Hash] options like status, etc
  # @return [Hash] formatted http response hash
  def response_for(response_file, options = {})
    response = {}
    response[:body] = load_json(response_file)
    if options[:status]
      response[:status] = options[:status]
    end
    response
  end
end

include WebMockHelper
WebMock.disable_net_connect!
