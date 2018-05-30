class AddPaymentToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :payment, :jsonb
  end
end
