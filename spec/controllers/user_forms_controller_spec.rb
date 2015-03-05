require 'rails_helper'

RSpec.describe UserFormsController, type: :controller do

let(:email_ok) { FormMailer.submit(message) }
let(:email_error) { FormMailer.submit(message) }

ActionMailer::Base.delivery_method = :test
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.deliveries = []

after(:each) do
  ActionMailer::Base.deliveries.clear
end

describe 'when distance is 0 < x <= 5' do
  its 'should send an email' do
    ActionMailer::Base.delivervies.count.should == 1
  end
  it 'sends mail Status ok' do
    get :create
    distance = 5 # [m]
    expect(email_ok.subject).to eq('Status ok')
    expect(email_ok).to have_content("Hey, you’ve found a treasure, congratulations!")
  end
end

describe 'when distance is more than 5' do
  it 'should send an email' do
    ActionMailer::Base.deliveries.count.should == 1
  end
  it 'sends mail Status ok' do
    get :create
    distance = 10
    expect(email_ok.subject).to eq('Status ok')
  end
end

describe 'when distance is not correct' do
  it 'should send and email' do
    ActionMailer::Base.deliveries.count.should == 1
  end
  it 'sends mail Status error' do
    get :create
    distance = -1
    expect(email_ok.subject).to eq('Status error')
  end
end

end
