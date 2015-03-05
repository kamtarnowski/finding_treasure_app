class FormMailer < ApplicationMailer

  def congratulations(distance, email)
    @email = email
    @treasure = "Treasure coordinates are: 50.051227 N, 19.945704 E."
    @distance = "The distance is: #{distance} m."
    mail(to: @email, subject: 'Congratulations! || Finding Treasure')
  end
end
