require 'faraday'
require 'ac_ticket.rb'
require 'tests_ticket.rb'

class TestSuite  

  vary = Ac_ticket.new()
  newTicket = vary.createNewTicket("Hello",191339543)
  
  #puts "New ticket " + newTicket.to_s()
    
  firstTicket = Tests_ticket.new(vary.getXMLTicket(newTicket).to_s())
  firstTicket.Verify_that_this_assignee_is_correct(191339543)
  firstTicket.Verify_that_correct_description_is_on_the_ticket("Hello")
 
 
  
  #puts "From the suite :" + newTicket.to_s()
  #puts "The hole ticket :" + vary.getXMLTicket(newTicket).to_s()
  
    
  
  #########################################################################
  # Old experiments
  #########################################################################
  
  #    puts "Conneting to website"
  #
  #    #response = Faraday.get 'http://sellert.zendesk.com/api/v1/users.xml'
  #  conn = Faraday.new(:url => 'http://sellert.zendesk.com') do |builder|
  #    builder.use Faraday::Request::UrlEncoded  # convert request params as "www-form-urlencoded"
  ##    builder.use Faraday::Request::BasicAuthentication, 'hr.sellert@gmail.com', 'ses112'
  #    builder.use Faraday::Response::Logger     # log the request to STDOUT
  #    builder.use Faraday::Adapter::NetHttp     # make http requests with Net::HTTP
  #    #builder.use Faraday::Adapter::NetHttps
  # #   builder.use CookieAuth
  #  end
  #  
  #    response = conn.get  '/api/v1/users.xml' , 'Authorization' => 'Basic aHIuc2VsbGVydEBnbWFpbC5jb206c2VzMTEy' 
  #  
  #  puts response.body
  
  
  
  
  
  #  #Create a user 
#  ticket =   "<ticket><description>Test</description><requester_id>191339543</requester_id></ticket>"
#  user = "<user><name>Albert Johnson</name><remote-photo-url>http://www.example.com/directory/image.png</remote-photo-url><current-tags>tag_a tab_b tag_c</current-tags><groups type=\"array\"><group>2</group></groups></user>"
#  
#  conn.post do |add|
#    add.url '/api/v1/users.xml'
#    add.headers['Authorization'] = 'Basic aHIuc2VsbGVydEBnbWFpbC5jb206c2VzMTEy'
#    add.headers['Content-Type'] = 'application/xml'
#    add.body = user
#  end
#  
#  
#  conn.post do |req|
#    req.url '/tickets.xml' #, 'Authorization' => 'Basic aHIuc2VsbGVydEBnbWFpbC5jb206c2VzMTEy'
#    req.headers['Authorization'] = 'Basic aHIuc2VsbGVydEBnbWFpbC5jb206c2VzMTEy'
#    req.headers['Content-Type'] = 'application/xml'
#    req.body = ticket
#  end

#  response = conn.get  '/api/v1/users.xml' , 'Authorization' => 'Basic aHIuc2VsbGVydEBnbWFpbC5jb206c2VzMTEy' 
#   
#   puts response.body
end