module Coornverter
  extend self
  
  class Point
    attr_reader :lat
    attr_reader :lng
    
    def initialize(lat, lng)
      @lat, @lng = lat, lng
    end
  end
  
  def parse(*args)
    lat, lng = [args].flatten
    
    if lat && lng.nil?
      lat, lng = lat.split(',')
    end
    
    Point.new parse_coor(lat), parse_coor(lng)
  end
  
  def parse_coor(coor)
    return coor if coor.is_a? Float

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

  private

  def normalize(coor)
    coor.gsub! /\s+/, ''
    coor.gsub! /^[NSWE]?/, ''
    coor.gsub! /"/, "''"
    coor.gsub! /°$/, ''
    coor
  end
  
end
