module StaticPagesHelper
  def distance_cor(lantitude, longtitude)
    treasure = [50.051227, 19.945704]
    delta_lat = (lantitude - treasure[0]).abs
    delta_lng = (longtitude - treasure[1]).abs
    distance_xy = (Math.sqrt(delta_lng**2 + delta_lat**2)).round(6)
    (distance_xy * 111196.672).round
    byebug
  end
end
