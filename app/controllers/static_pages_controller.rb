class StaticPagesController < ApplicationController
  def new
  end

  def form
    if request.post?
      render :new
    else
      redirect_to root_url, :notice => 'Success'
    end
  end
end
