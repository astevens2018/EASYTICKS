class AddTimeToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :time, :string
  end
end
