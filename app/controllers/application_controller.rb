class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!, :only => [""]
  
  def index
  end
  
  def get_static
     if template_exists? path = 'application/' + params[:id]
       render :template => path, :layout => false
     else
       render :template => 'application/index', :layout => false
     end
  end
  
  def after_sign_in_path_for(resource)
   logger.debug "\n\n\n##### #{root_path}\n\n"
   logger.debug "\n\n\n##### #{request.referer}\n\n"
   root_path
  end
end
