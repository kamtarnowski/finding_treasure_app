class Treasure

  def initialize(lat, lng)
    @lat= lat
    @lng= lng
  end

  def calculate_distance(lat2, lng2)
    treasure = [@lat, @lng]
    current_localization = [lat2, lng2]
    Haversine.distance(treasure, current_localization).to_m.to_i
  end

end