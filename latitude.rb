def latitude(x, y)

  delta_lat= (x[1] - y[1]).abs
  delta_len= (x[0] - y[0]).abs
  d_xy = (Math.sqrt(delta_len**2 + delta_lat**2)).round(6)
  result = (d_xy * 111196.672).round
  puts "#{result} m"

end

a = [50.084859, 19.975720]
b = [50.084870, 19.976428]
latitude(a, b)
