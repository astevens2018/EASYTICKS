class RemovePriceFromTickets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :price
    add_monetize :tickets, :price, currency: { present: false }
  end
end
