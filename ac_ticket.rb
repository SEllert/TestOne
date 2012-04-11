###################################################################
#Description
# Application Driver as a Counterpart for the creation and
# maintainance of tickets.
#
# @author: Sigurdur Ellert Sigurjónsson
# @email: hr.sellert@gmail.com
###################################################################
require 'faraday'


class Ac_ticket

  #Setting the connection
  @@conn = Faraday.new(:url => 'http://sellert.zendesk.com/api/v1') do |builder|
    builder.use Faraday::Request::UrlEncoded  # convert request params as "www-form-urlencoded"
    builder.use Faraday::Response::Logger     # log the request to STDOUT
    builder.use Faraday::Adapter::NetHttp     # make http requests with Net::HTTP
  end

  # Creates a simple ticket
  # @params description: Value of can be none
  # @params requester_id: The id of the requester
  # @returns the xml to the new ticket created
  def createNewTicket(description=0, requesterid=0)

    # make a default description if none is provided
    if description == 0
      description = "Default description in a test at " + Time.new.to_s()
    end

    #Post the request to the server
    resp = @@conn.post do |req|
      req.url '/tickets.xml'
      req.headers['Authorization'] = 'Basic aHIuc2VsbGVydEBnbWFpbC5jb206c2VzMTEy' #@TODO make this a class param
      req.headers['Content-Type'] = 'application/xml'
      req.body = "<ticket><description>"+ description.to_s() +"</description><requester_id>"+ requesterid.to_s() +"</requester_id></ticket>"
    end

    #Formating the return
    returnXML = resp['location'].to_s()
    returnXML.slice! "http://sellert.zendesk.com/api/v1"

    return returnXML
  end
  
  # Fetches a ticket to the system
  # @param  path      : The path to the ticket
  # @return xmlTicket :   The ticket in a XML format
  def getXMLTicket(path)
    resp2 = @@conn.get do |req|
      req.url path
      req.headers['Authorization'] = 'Basic aHIuc2VsbGVydEBnbWFpbC5jb206c2VzMTEy' #@TODO make this a param
      req.headers['Content-Type'] = 'application/xml'
    end
   # puts "Responce : " + resp2['body'].inspect
   # puts "Responce2 : " + resp2.body.to_s()
      
    return resp2.body.to_s()
  end
end