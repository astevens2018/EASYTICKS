class AddAuthyIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :authy_id, :string
  end
end
