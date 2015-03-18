class UserFormsController < ApplicationController
  TOKEN = ['D87B6FCECA9D98E3E2A842DD62674', '1CED1C7F1856E7B6CEDB478337AF8', 'E1E7894A72B6DE939C157BA67CC52', '592BA14D339FD65432E288A9C6792']

  before_action :authenticate, only: :create

  def new
    @form = UserForm.new
  end

  def create
    respond_to do |format|
      if request.post?
        @treasure = Treasure.new
        @treasure.lat = 50.051227
        @treasure.lng = 19.945704
        @form = UserForm.new(params[:user_form])
        @form.request = request
        if @form.valid?
          lat = @form.latitude.to_f
          lng = @form.longitude.to_f
          distance = @treasure.calculate_distance(lat, lng)
          @success = { status: 'ok', distance: distance }
          @error = { status: 'error', distance: distance < 0 ? (distance) : ('-') }

          if 5 >= distance &&  distance >= 0
            format.js { render :json => @success.to_json, content_type: 'application/json' }
            @form.distance = "#{distance} m"
            @form.latitude = @treasure.lat
            @form.longitude = @treasure.lng
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
            distance = @treasure.calculate_distance(lat, lng)
            @error = { status: 'error', distance: distance, error: @error_messages }
          else
            @error = { status: 'error', distance: '-', error: @error_messages }
          end
          format.js { render :json => @error.to_json, content_type: 'application/json' }
        end
      end
    end
  end

  private

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      TOKEN.include?(token)
    end
  end
end