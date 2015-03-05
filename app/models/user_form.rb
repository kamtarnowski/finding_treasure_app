class UserForm < MailForm::Base
  attribute :latitude,      :validate => /\A[0-9\,.]*\z/
  attribute :longitude,     :validate => /\A[0-9\,.]*\z/
  attribute :dist, :allow_blank => true
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :nickname,  :captcha  => true

  def headers
    {
        :subject => 'Congratulations! || Finding Treasure',
        :to => email
    }
  end
end