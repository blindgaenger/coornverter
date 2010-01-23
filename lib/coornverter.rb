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
      coor.gsub! /°$/, ''
      coor
    end
    
    def self.parse_coor(coor)
      if coor
        coor = normalize(coor)
        if coor =~ /^(\d+\.\d+)$/ # Dec: DD.DDDDDD°
          return $1.to_f
        elsif coor =~ /^(\d+)°(\d+\.\d+)'?$/ # Deg: DD°MM.MMMM’
          return $1.to_f + $2.to_f/60
        elsif coor =~ /^(\d+)°(\d+)'(\d+)''$/ # DMS: DD° MM' SS"
          return $1.to_f + $2.to_f/60 + $3.to_f/3600
        end
      end
      raise "unknown format #{coor}"
    end
    
  end
  
end
