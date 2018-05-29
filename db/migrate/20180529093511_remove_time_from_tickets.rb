class RemoveTimeFromTickets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :time
  end
end
