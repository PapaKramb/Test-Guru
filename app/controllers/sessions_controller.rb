class SessionsController < Devise::SessionsController

  def create
    super
    flash[:success] = "Hello, #{current_user.first_name}!"
  end
  
end
