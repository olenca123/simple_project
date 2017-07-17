class AddPasswordDigestToSignup < ActiveRecord::Migration[5.1]
  def change
    add_column :signups, :password_digest, :string
  end
end
