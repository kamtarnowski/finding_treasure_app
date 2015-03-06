class UserForm < MailForm::Base
  attribute :latitude,      :validate => /\A[0-9\,.]*\z/
  attribute :longitude,     :validate => /\A[0-9\,.]*\z/
  attribute :distance, :allow_blank => true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :token, validate: true
  attribute :nickname,  :captcha  => true

  def headers
    {
        :subject => 'Hey, you’ve found a treasure, congratulations!',
        :to => email
    }
  end
end