require 'rails_helper'

RSpec.describe UserFormsController, type: :controller do

ActionMailer::Base.delivery_method = :test
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.deliveries = []

  describe 'TOKEN AUTHORIZATION' do
    describe "with successfull response" do
      it 'should have 200 response' do
        request.env["HTTP_AUTHORIZATION"] = "Token token=D87B6FCECA9D98E3E2A842DD62674"
        @request.env["HTTP_ACCEPT"] = "application/json"
        @request.env["CONTENT_TYPE"] = "application/json"
        post :create, user_form: FactoryGirl.attributes_for(:user_form), format: :js
        expect(response.response_code).to eq 200
        expect {
          JSON.parse(response.body)
        }.to_not raise_error
      end

      describe 'submitted valid inputs into form' do
        let(:form_win) { FactoryGirl.build(:user_form, latitude: 50.05125, longitude: 19.945704) }
        let(:form_ok) { FactoryGirl.build(:user_form) }
        it 'should be valid' do
          expect(form_win).to be_valid
          expect(form_ok).to be_valid
        end

        after(:each) do
          ActionMailer::Base.deliveries.clear
        end

        describe "the distance is 0 <= distance <= 5" do
          it 'should send an email' do
            request.env["HTTP_AUTHORIZATION"] = "Token token=D87B6FCECA9D98E3E2A842DD62674"
            @request.env["HTTP_ACCEPT"] = "application/json"
            @request.env["CONTENT_TYPE"] = "application/json"
            post :create, user_form: FactoryGirl.attributes_for(:user_form, latitude: 50.05125, longitude: 19.945704), format: :js
            ActionMailer::Base.deliveries.count == 1
            expect {
              JSON.parse(response.body)
            }.to_not raise_error
          end
        end

        describe "the distance is more than 5" do
          it 'should have particular format of json message' do
            request.env["HTTP_AUTHORIZATION"] = "Token token=D87B6FCECA9D98E3E2A842DD62674"
            @request.env["HTTP_ACCEPT"] = "application/json"
            @request.env["CONTENT_TYPE"] = "application/json"
            post :create, user_form: FactoryGirl.attributes_for(:user_form), format: :js
            treasure = [50.051227, 19.945704]
            current_localization = [form_ok.latitude, form_ok.longitude]
            distance = Haversine.distance(treasure, current_localization).to_m.to_i
            @status_ok = {
                status: 'ok',
                distance: distance
            }.to_json
            expect(response.body).to eq @status_ok
          end
        end
      end

      describe 'submitted invalid inputs into form' do
        let(:form) { FactoryGirl.build(:user_form, email: '', latitude: '') }
        it 'should be not valid' do
          expect(form).to_not be_valid
        end
      end
    end

    describe "with unsuccessfull response" do
      it 'should have 401 response' do
        request.env["HTTP_AUTHORIZATION"] = "Token token=secret_token"
        @request.env["HTTP_ACCEPT"] = "application/json"
        @request.env["CONTENT_TYPE"] = "application/json"
        post :create, user_form: FactoryGirl.attributes_for(:user_form), format: :js
        expect(response.response_code).to eq 401
        expect {
          JSON.parse(response.body)
        }.to raise_error
      end
    end
  end
end
