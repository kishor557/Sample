class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and 
  devise :database_authenticatable, :registerable,:token_authenticatable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
   def self.find_for_facebook_oauth(access_token)
     data = access_token['extra']['raw_info']
     if user = User.find_by_email(data["email"])
       user
     else # Create an user with a stub password. 
       User.create!(:email => data["email"], :password => Devise.friendly_token[0,20]) 
     end
   end
end
