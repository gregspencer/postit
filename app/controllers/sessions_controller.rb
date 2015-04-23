class SessionsController <  ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You've logged in successfully"
      redirect_to root_path
    else
      flash[:error] = "Either your username or password was incorrect"
      redirect_to login_path
    end
      
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out"
    redirect_to root_path
  end
  
end