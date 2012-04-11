require 'faraday'

class TestSuite

    puts "Conneting to website"

    #response = Faraday.get 'https://sellert.zendesk.com/api/v1/users.xml'
    

    
    
    
  conn = Faraday.new(:url => 'http://sellert.zendesk.com') do |builder|
    builder.use Faraday::Request::UrlEncoded  # convert request params as "www-form-urlencoded"
#    builder.use Faraday::Request::BasicAuthentication, 'hr.sellert@gmail.com', 'ses112'
    builder.use Faraday::Response::Logger     # log the request to STDOUT
    builder.use Faraday::Adapter::NetHttp     # make http requests with Net::HTTP
 #   builder.use CookieAuth
  end
  
    response = conn.get  '/api/v1/users.xml', 'Authorization' => 'Basic aHIuc2VsbGVydEBnbWFpbC5jb206c2VzMTEy' 
  
 
    def test01
      puts response.body   
    end
    
end