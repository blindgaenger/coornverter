require 'rubygems'
require 'test/unit'
require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'coornverter'

class Test::Unit::TestCase
  
  #
  # the trick is to convert to a string, which is accurate for 0.000000000000001
  def assert_equal_float(a, b)
    assert_equal a.to_s, b.to_s
  end
  
  def assert_parse(expected_lat, expected_lng, *actual_values)
    coor = Coornverter::LatLng.parse *actual_values
    assert_equal_float expected_lat, coor.lat
    assert_equal_float expected_lng, coor.lng
  end
  
  def assert_parse_coor(expected, actual)
    coor = Coornverter::LatLng.parse_coor(actual)
    assert_equal_float expected, coor
  end
  
  def reject_parse_coor(coor)
    begin
      Coornverter::LatLng.parse_coor(coor)
      flunk "coor was parsed, but should be invalid: #{coor}"
    rescue RuntimeError
      # expected
    end
  end

end
