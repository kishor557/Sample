class RegistrationsController < Devise::RegistrationsController
  
  def new
    render :layout => false
  end
  
  def create
    super
  end
end
