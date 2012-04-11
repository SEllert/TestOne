###################################################################
#Description 
# Contains test cases for Tickets and  relavant procedures
#
#@author: Sigurdur Ellert Sigurjónsson
#@email: hr.sellert@gmail.com
###################################################################
require 'crack'
require 'test/unit'
include Test::Unit::Assertions

# @Todo needs to extend the test class
# @params   xmlOfTicket   :     The body of the ticket as it comes from 
# @return   gives true or false 

class Tests_ticket < Test::Unit::TestCase
  attr_accessor :xmlTicket
  
  def initialize(xmlTicket)
    @@xmlTicket = Crack::XML.parse(xmlTicket)
  end
  
  def Verify_that_this_assignee_is_correct(requesterId)
    xmlDescription =  @@xmlTicket['ticket']['assignee_id'].to_s()
        testDrequesterId = requesterId
        puts "Verifyint that  #{xmlDescription} equals #{testDrequesterId} "  
   
      assert_equal(@@xmlTicket['ticket']['assignee_id'], requesterId, "The id was not equal to #{requesterId}")
  end
  
  def Verify_that_correct_description_is_on_the_ticket(description)
    xmlDescription =  @@xmlTicket['ticket']['description'].to_s()
    testDescription = description
    puts "Verifyint that  #{xmlDescription} equals #{testDescription} " 
    assert_equal(@@xmlTicket['ticket']['description'].to_s(), description, "The discription did not match #{description}")
  end
end