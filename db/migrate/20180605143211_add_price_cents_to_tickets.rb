class AddPriceCentsToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :price_cents, :integer
  end
end
