class AddBankDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
       add_column :users, :bankaccount, :string
  end
end
