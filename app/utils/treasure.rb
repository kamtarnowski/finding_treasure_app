class Treasure

  attr_accessor :lat, :lng

  def calculate_distance(lat2, lng2)
    treasure = [@lat, @lng]
    current_localization = [lat2, lng2]
    Haversine.distance(treasure, current_localization).to_m.to_i
  end

end