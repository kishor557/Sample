class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_filter :authenticate_user!, :except => ["facebook", :google_oauth2]

  def facebook
    # You need to implement the method below in your model
    @user = User.find_for_facebook_oauth(env["omniauth.auth"])  

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  
  def google_oauth2
    omniauth = request.env["omniauth.auth"]
    @user = User.find_by_email(omniauth['extra']['raw_info']['email'])
    data = omniauth['extra']['raw_info']
    unless @user.blank?
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect @user, :event => :authentication
    else
      user = User.new
      user.email =  data["email"]
      user.password = Devise.friendly_token[0,20]
      user.skip_confirmation!
      if user.save
         sign_in_and_redirect user, :event => :authentication
      else
        redirect_to new_user_registration_url
      end
    end  
  end
end
