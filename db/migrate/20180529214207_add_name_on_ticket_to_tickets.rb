class AddNameOnTicketToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :name_on_ticket, :string
  end
end
