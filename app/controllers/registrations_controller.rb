class RegistrationsController < Devise::RegistrationsController
  before_filter :load_layout, :except => :create
  
  def new
  end
  
  def create
    super
  end
  
  private
    def load_layout
      if current_user
        if params[:layout]
          current_user ? current_user.update_attribute(:layout, params[:layout]) : ""
          render :layout => params[:layout]
        else
          render :layout => current_user.layout
        end
      else
        if params[:layout] && params[:layout] != "false"
          render :layout => params[:layout]
        else
          render :layout => 'new_layout'
        end
      end
    end
end
