class UserFormsController < ApplicationController
  def new
    @form = UserForm.new
  end

  def create
    respond_to do |format|
      if request.post?
        @form = UserForm.new
        lat = params[:forms][:latitude].to_i
        lng = params[:forms][:longtitude].to_i
        email = params[:forms][:email].to_s
        if params[:forms][:dist] == ''
          distance = distance_via_help(lat, lng)
        end
        distance ||= params[:forms][:dist].to_i
        @success = { status: 'ok', distance: distance }
        @error = { status: 'error', distance: distance < 0 ? (distance) : ('-') }

        if 5 >= distance &&  distance >= 0
          format.js { render :json => @success.to_json, content_type: 'application/json' }
          FormMailer.congratulations(distance, email)
        elsif distance > 5
          format.js { render :json => @success.to_json, content_type: 'application/json' }
        else
          format.js { render :json => @error.to_json, content_type: 'application/json' }
        end
      end
    end
  end
end
