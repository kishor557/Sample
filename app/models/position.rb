class Position < ActiveRecord::Base
  attr_accessible :name, :left, :top
  
  belongs_to :user
end
