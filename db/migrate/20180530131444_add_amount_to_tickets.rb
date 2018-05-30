class AddAmountToTickets < ActiveRecord::Migration[5.2]
  def change
    add_monetize :tickets, :amount, currency: { present: false }
  end
end
