class StaticPagesController < ApplicationController
  def new
  end

  def form
    respond_to do |format|
      if request.post?
        result = distance_cor(params[:forms][:latitude].to_i, params[:forms][:longitude].to_i).to_i
        @object = { status: 'ok', distance: result }
        if 5 >= result &&  result > 0
          format.html
          format.js {  }

        elsif result > 5
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
