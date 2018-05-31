class AddVerifiedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :verified, :boolean
  end
end
