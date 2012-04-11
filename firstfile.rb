require 'faraday'

class Firstfile
  conn = Faraday.new(:url => 'http://sushi.com') do |builder|
    builder.use Faraday::Request::UrlEncoded  # convert request params as "www-form-urlencoded"
    builder.use Faraday::Request::JSON        # encode request params as json
    builder.use Faraday::Response::Logger     # log the request to STDOUT
    builder.use Faraday::Adapter::NetHttp     # make http requests with Net::HTTP
  
    # or, use shortcuts:
    builder.request  :url_encoded
    builder.request  :json
    builder.response :logger
    builder.adapter  :net_http
  end
  
  conn.get '/nigiri', 'Authentication' => true     # custom request header
  
  puts response.body
  
  
end