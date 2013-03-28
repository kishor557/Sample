class SessionsController < Devise::SessionsController
  
  def new
    render :layout => false
  end
   
  def destroy
    super
  end
end
