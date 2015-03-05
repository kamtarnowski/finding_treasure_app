class UserFormsController < ApplicationController
  def new
    @form = UserForm.new
  end

  def create
    respond_to do |format|
      if request.post?
        @form = UserForm.new(params[:user_form])
        @form.request = request
        if @form.valid?
          lat = @form.latitude.to_f
          lng = @form.longitude.to_f
          distance = distance_via_helper(lat, lng)
          @success = { status: 'ok', distance: distance }
          @error = { status: 'error', distance: distance < 0 ? (distance) : ('-') }

          if 5 >= distance &&  distance >= 0
            format.js { render :json => @success.to_json, content_type: 'application/json' }
            @form.distance = "#{distance} m"
            @form.latitude = 50.051227
            @form.longitude = 19.945704
            @form.deliver
          elsif distance > 5
            format.js { render :json => @success.to_json, content_type: 'application/json' }
          else
            format.js { render :json => @error.to_json, content_type: 'application/json' }
          end

        else
          @error_messages = @form.errors.full_messages
          if (@form.latitude && @form.longitude).present?
            lat = @form.latitude.to_f
            lng = @form.longitude.to_f
            distance = distance_via_helper(lat, lng)
            @error = { status: 'error', distance: distance, error: @error_messages }
          else
            @error = { status: 'error', distance: '-', error: @error_messages }
          end
          format.js { render :json => @error.to_json, content_type: 'application/json' }
        end
      end
    end
  end
end
