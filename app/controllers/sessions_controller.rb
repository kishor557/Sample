class SessionsController < Devise::SessionsController
  
  before_filter :load_layout, :except => [:create, :destroy]
  
  def new
  
  end
   
  def destroy
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
        if params[:layout]
          render :layout => params[:layout]
        else
          render :layout => 'new_layout'
        end
      end
    end
end
