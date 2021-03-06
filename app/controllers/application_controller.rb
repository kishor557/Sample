class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!, :only => [""]
  before_filter :load_layout, :only => [:index]
  
  
  def index
  end
  
  def get_static
     if template_exists? path = 'application/' + params[:id]
       render :template => path, :layout => false
     else
       render :template => 'application/index', :layout => false
     end
  end
  
  def extra
    status = ""
    if current_user && !params.blank?
      pos = Position.where(:user_id => current_user.id, :name => params[:name])
      unless pos.blank?
        position = Position.find(pos[0].id)
        position.update_attributes(:left => params[:left], :top => params[:top])
      else
       current_user.positions.create(:name => params[:name], :left => params[:left], :top => params[:top])
      end
      status = "success"
    else
      status = "fail"
    end
    render :json => status.to_json
  end
  
  def after_sign_in_path_for(resource)
   logger.debug "\n\n\n##### #{root_path}\n\n"
   logger.debug "\n\n\n##### #{request.referer}\n\n"
   root_path
  end
  
  
  private
    def load_layout
      if current_user
        if params[:layout]
          current_user ? current_user.update_attribute(:layout, params[:layout]) : ""
          render :layout => params[:layout]
        else
          render :layout => current_user.layout.blank? ? "new_layout" : current_user.layout 
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
