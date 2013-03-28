module ApplicationHelper

  def devise_mapping
    Devise.mappings[:user]
  end

  def resource_name
    devise_mapping.name
  end

  def resource_class
    devise_mapping.to
  end
  
  def check_pos(id)
   if current_user
      pos = Position.where(:user_id => current_user.id, :name => id).last
      "left:"+pos.left.to_s+"px;top:"+pos.top.to_s+"px;" unless pos.blank?
   else
     ""
   end
  end
end
