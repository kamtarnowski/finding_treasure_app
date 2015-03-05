class StaticPagesController < ApplicationController
  def new
  end

  def form
    respond_to do |format|
      if request.post?
        distance = params[:forms][:dist].to_i
        @object = { status: 'ok', distance: distance }
        if 5 >= distance &&  distance > 0
          format.html
          format.js {  }

        elsif distance > 5
          format.html
          format.js { render :json => @object.to_json, content_type: 'application/json'}


        else
          format.html
          format.js {  }

        end
      end
    end
  end
end
