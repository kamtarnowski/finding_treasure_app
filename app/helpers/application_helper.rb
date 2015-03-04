module ApplicationHelper
  def distance_cor(longtitude, lantitude)
    treasure = [50.051227, 19.945704]
    delta_lat = (lantitude - treasure[1]).abs
    delta_lon = (longtitude - treasure[0]).abs
    d_xy = (Math.sqrt(delta_lon**2 + delta_lat**2)).round(6)
    (d_xy * 111196.672).round
  end
end
