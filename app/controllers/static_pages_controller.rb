class StaticPagesController < ApplicationController
  def new
  end

  def form
    respond_to do |format|
      if request.post?
        result = distance_cor(params[:forms][:longitude].to_i, params[:forms][:latitude].to_i).to_i
        @object = { status: 'ok', distance: result }
        if 5 >= result &&  result > 0
          format.html
          format.js { render 'success.js.erb' }

        elsif result > 5
          format.html
          format.js { render :json => @object.to_json, content_type: 'application/json'}


        else
          format.html
          format.js { render 'error.js.erb' }

        end
      end
    end
  end

  def distance_cor(longtitude, lantitude)
    treasure = [50.051227, 19.945704]
    delta_lat = (lantitude - treasure[1]).abs
    delta_lon = (longtitude - treasure[0]).abs
    d_xy = (Math.sqrt(delta_lon**2 + delta_lat**2)).round(6)
    (d_xy * 111196.672).round
  end
end
