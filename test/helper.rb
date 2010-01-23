require 'rubygems'
require 'test/unit'
require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'coornverter'

class Test::Unit::TestCase
  
  def assert_parse(expected_lat, expected_lng, *actual_values)
    coor = Coornverter::Coor.parse *actual_values
    assert_equal expected_lat, coor.lat
    assert_equal expected_lng, coor.lng
  end
  
  def assert_parse_type(expected, type, *actual)
    coor = Coornverter::Coor.send "parse_#{type}".to_sym, *actual
    assert_equal expected, coor
  end
  
end
