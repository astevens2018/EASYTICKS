class RemoveAmountCentsFromTickets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :amount_cents
  end
end
