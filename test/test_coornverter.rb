require 'helper'

class TestCoornverter < Test::Unit::TestCase

  context "Parser" do

    should "parse Dec values" do
      assert_parse_type 53.569683, :dec, "N 53.569683°"
      assert_parse_type 53.569683, :dec, "N53.569683°"
      assert_parse_type 53.569683, :dec, "53.569683°"
      assert_parse_type 53.569683, :dec, "53.569683"

      assert_parse_type 9.978, :dec, "E 09.978000°"
      assert_parse_type 9.978, :dec, "E09.978000°"
      assert_parse_type 9.978, :dec, "09.978000°"
      assert_parse_type 9.978, :dec, "09.978000"
    end

    should "parse Deg values" do      
      assert_parse_type 53.5696833333333, :deg, "N 53° 34.181'"
      assert_parse_type 53.5696833333333, :deg, "N53° 34.181'"
      assert_parse_type 53.5696833333333, :deg, "53° 34.181'"
      assert_parse_type 53.5696833333333, :deg, "53° 34.181"
      assert_parse_type 53.5696833333333, :deg, "53°34.181'"
      assert_parse_type 53.5696833333333, :deg, "53°34.181"
    
      assert_parse_type 9.978, :deg, "E 009° 58.680'"
      assert_parse_type 9.978, :deg, "E009° 58.680'"
      assert_parse_type 9.978, :deg, "009° 58.680'"
      assert_parse_type 9.978, :deg, "009° 58.680"
      assert_parse_type 9.978, :deg, "009°58.680'"
      assert_parse_type 9.978, :deg, "009°58.680"
    end
  
    should "parse DMS values" do      
      assert_parse_type 53.5697222222222, :dms, "N 53° 34' 11\""
      assert_parse_type 53.5697222222222, :dms, "N 53° 34' 11''"
      assert_parse_type 53.5697222222222, :dms, "N53° 34' 11''"
      assert_parse_type 53.5697222222222, :dms, "53° 34' 11''"
      assert_parse_type 53.5697222222222, :dms, "53°34'11''"
    
      assert_parse_type 9.97805555555555, :dms, "E 09° 58' 41\""
      assert_parse_type 9.97805555555555, :dms, "E 09° 58' 41''"
      assert_parse_type 9.97805555555555, :dms, "E09° 58' 41''"
      assert_parse_type 9.97805555555555, :dms, "09° 58' 41''"
      assert_parse_type 9.97805555555555, :dms, "09°58'41''"  
    end

  end
  
end
