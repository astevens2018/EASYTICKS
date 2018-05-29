class AddIdentityCardToUsers < ActiveRecord::Migration[5.2]
  def change
       add_column :users, :identitycard, :string
  end
end
