class StaticPagesController < ApplicationController
  def new
  end

  def form
    if request.post?
      len = :forms[:longitude]
      lat = :forms[:latitude]
      email = :forms[:email]


      redirect_to root_path
      

    else

    end
  end
end
