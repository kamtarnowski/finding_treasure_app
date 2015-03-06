FactoryGirl.define do
  factory :access_token do
    active true
  end

  factory :inactive_access_token do
    active false
  end
end