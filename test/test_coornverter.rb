require 'helper'

class TestCoornverter < Test::Unit::TestCase

  context "as module" do
    Coornverter.parse "N 53.569683°", "E 09.978000°"
  end

  context "as parser" do

    should "parse Dec values" do
      assert_parse_coor 53.569683, "N 53.569683°"
      assert_parse_coor 53.569683, "N53.569683°"
      assert_parse_coor 53.569683, "53.569683°"
      assert_parse_coor 53.569683, "53.569683"

      assert_parse_coor 9.978, "E 09.978000°"
      assert_parse_coor 9.978, "E09.978000°"
      assert_parse_coor 9.978, "09.978000°"
      assert_parse_coor 9.978, "09.978000"
    end

    should "parse Deg values" do      
      assert_parse_coor 53.5696833333333, "N 53° 34.181'"
      assert_parse_coor 53.5696833333333, "N53° 34.181'"
      assert_parse_coor 53.5696833333333, "53° 34.181'"
      assert_parse_coor 53.5696833333333, "53° 34.181"
      assert_parse_coor 53.5696833333333, "53°34.181'"
      assert_parse_coor 53.5696833333333, "53°34.181"

      assert_parse_coor 9.978, "E 009° 58.680'"
      assert_parse_coor 9.978, "E009° 58.680'"
      assert_parse_coor 9.978, "009° 58.680'"
      assert_parse_coor 9.978, "009° 58.680"
      assert_parse_coor 9.978, "009°58.680'"
      assert_parse_coor 9.978, "009°58.680"
    end

    should "parse DMS values" do      
      assert_parse_coor 53.5697222222222, "N 53° 34' 11\""
      assert_parse_coor 53.5697222222222, "N 53° 34' 11''"
      assert_parse_coor 53.5697222222222, "N53° 34' 11''"
      assert_parse_coor 53.5697222222222, "53° 34' 11''"
      assert_parse_coor 53.5697222222222, "53°34'11''"
                                          
      assert_parse_coor 9.97805555555555, "E 09° 58' 41\""
      assert_parse_coor 9.97805555555555, "E 09° 58' 41''"
      assert_parse_coor 9.97805555555555, "E09° 58' 41''"
      assert_parse_coor 9.97805555555555, "09° 58' 41''"
      assert_parse_coor 9.97805555555555, "09°58'41''"  
    end
    
    should "reject invalid values" do
      reject_parse_coor nil
      reject_parse_coor ''
      reject_parse_coor '  '
      reject_parse_coor 'something'
      reject_parse_coor '1234'
      reject_parse_coor '53.1X1' 
    end

    should "parse values from strings" do
      assert_parse 53.569683, 9.978, ["N 53.569683°", "E 09.978000°"]
      assert_parse 53.569683, 9.978, "N 53.569683°", "E 09.978000°"
      assert_parse 53.569683, 9.978, "N 53.569683°, E 09.978000°"
    end
      
    should "parse values from floats" do
      assert_parse 53.569683, 9.978, [53.569683, 9.978]
      assert_parse 53.569683, 9.978, 53.569683, 9.978
    end
    
    should "parse values from mixed types" do
      assert_parse 53.569683, 9.978, [53.569683, "E 09.978000°"]
      assert_parse 53.569683, 9.978, 53.569683, "E 09.978000°"
      assert_parse 53.569683, 9.978, "53.569683, E 09.978000°"
    end

  end
  
end
