module Coornverter
  
  class LatLng
    attr_accessor :lat
    attr_accessor :lng
    
    def initialize(lat, lng)
      @lat, @lng = lat, lng
    end

    def self.parse(*args)
      lat, lng = args
      LatLng.new parse_deg(lat), parse_deg(lng)
    end
    
    protected
    
    def self.normalize(coor)
      coor.gsub! /\s+/, ''
      coor.gsub! /^[NSWE]?/, ''
      coor.gsub! /"/, "''"
      coor
    end
    
    # Dec: DD.DDDDDD°
    def self.parse_dec(coor)
      normalize(coor).chomp('°').to_f
    end
    
    # Deg: DD°MM.MMMM’
    def self.parse_deg(coor)      
      normalize(coor).gsub(/(\d+)°(\d+\.\d+)'?/) do
        $1.to_f + $2.to_f/60
      end.to_f
    end
    
    # DMS: DD° MM' SS"
    def self.parse_dms(coor)      
      normalize(coor).gsub(/(\d+)°(\d+)'(\d+)''/) do
        $1.to_f + $2.to_f/60 + $3.to_f/3600
      end.to_f
    end
    
  end
  
end
