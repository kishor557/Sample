class AddLayoutColumnToUsers < ActiveRecord::Migration
  def change
   add_column :users, :layout, :string, :after => :authentication_token
  end
end
