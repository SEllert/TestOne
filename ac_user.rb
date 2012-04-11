###################################################################
#Description 
# Application Driver as a Counterpart for the creation and 
# maintainance of customers.
#
#@author: Sigurdur Ellert Sigurjónsson
#@email: hr.sellert@gmail.com
###################################################################
require 'test/unit'
include Test::Unit::Assertions

class Ac_user 
  
  #assert_equal(1,2,"The id was not equal to")
  
  
  
  # Creates user 
  # @params email : E-mail for the new user
  # @params name  : First name of the user 
  # @params group : What access group does it belonge to 
  # @params 
  def createUser(values)
    puts "Hello treets" + values
  #  return "user = "<user><name>Albert Johnson</name><remote-photo-url>http://www.example.com/directory/image.png</remote-photo-url><current-tags>tag_a tab_b tag_c</current-tags><groups type=\"array\"><group>2</group></groups></user>"
  end
end