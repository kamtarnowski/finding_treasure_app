require 'rails_helper'

RSpec.describe UserFormsController, type: :controller do

# ActionMailer::Base.delivery_method = :test
# ActionMailer::Base.perform_deliveries = true
# ActionMailer::Base.deliveries = []
#
# after(:each) do
#   ActionMailer::Base.deliveries.clear
# end


  describe 'POST create' do

      it "should be successful" do
        credentials = ActionController::HttpAuthentication::Token.encode_credentials("D87B6FCECA9D98E3E2A842DD62674")
        post :create, {:entry => latitude: 50, longitude: 20, email: 'example@gmail.com'}, { HTTP_AUTHORIZATION => credentials}
        expect(response.response_code).to eq 200
      end



      # let(:access_token){ FactoryGirl.create(:access_token) }
      #
      # it "retrieves the posts" do
      #   # You will have to send HEADERS while making request like this:
      #   get api_v1_posts_path, nil, { HTTP_ACCESS_TOKEN => access_token.access_token }
      #
      #   expect(response.response_code).to eq 200
      # end
      #
      # it "requires a valid session key" do
      #   get api_v1_posts_path
      #
      #   expect(response.response_code).to eq 401
      # end

      # @request.env["HTTP_ACCEPT"] = "application/json"
      # @request.env["CONTENT_TYPE"] = "application/json"
      # put :post, "Authorization", "Token token=D87B6FCECA9D98E3E2A842DD62674"
      # ApiKey.create!(:access_token => 'D87B6FCECA9D98E3E2A842DD62674')
      # post :user_form, nil,
      #     :authorization => ActionController::HttpAuthentication::Token.encode_credentials("D87B6FCECA9D98E3E2A842DD62674")
      # assigns(:token).should be "D87B6FCECA9D98E3E2A842DD62674"
      # get :create
      # form = UserForm.new(latitude: 51, longitude: 20, email: 'example@gmail.com', token: 'D87B6FCECA9D98E3E2A842DD62674')
      #
      # expect(response).to have_http_status(200)




  end

    # describe 'when distance is 0 < x <= 5' do
    #   it 'should send an email' do
    #     ActionMailer::Base.delivervies.count.should == 1
    #   end
    #   it 'sends mail Status ok' do
    #     get :create
    #     distance = 5 # [m]
    #     expect(email_ok.subject).to eq('Status ok')
    #     expect(email_ok).to have_content("Hey, you’ve found a treasure, congratulations!")
    #   end
    # end
    #
    # describe 'when distance is more than 5' do
    #   it 'should send an email' do
    #     ActionMailer::Base.deliveries.count.should == 1
    #   end
    #   it 'sends mail Status ok' do
    #     get :create
    #     distance = 10
    #     expect(email_ok.subject).to eq('Status ok')
    #   end
    # end
    #
    # describe 'when distance is not correct' do
    #   it 'should send and email' do
    #     ActionMailer::Base.deliveries.count.should == 1
    #   end
    #   it 'sends mail Status error' do
    #     get :create
    #     distance = -1
    #     expect(email_ok.subject).to eq('Status error')
    #   end
    # end

end
