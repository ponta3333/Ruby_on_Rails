class HomeController < ApplicationController

before_action :login_user

  def top
  end

  def about
  end

private

  def login_user
	if current_user
		redirect_to user_path(current_user)
	end
  end
  
end