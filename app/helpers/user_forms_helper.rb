module UserFormsHelper
  def distance_via_helper(lat, lng)
    treasure = [50.051227, 19.945704]
    current_localization = [lat, lng]
    Haversine.distance(treasure, current_localization).to_m.to_i
  end
end
