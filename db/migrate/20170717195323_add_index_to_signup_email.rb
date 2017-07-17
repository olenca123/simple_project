class AddIndexToSignupEmail < ActiveRecord::Migration[5.1]
  def change
  	add_index :signups, :email, unique: true 
  end
end
