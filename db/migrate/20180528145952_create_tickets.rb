class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.references :buyer
      t.references :seller
      t.date :date
      t.time :time
      t.string :departing_city
      t.string :arrival_city
      t.integer :price
      t.string :booking_reference
      t.timestamps
    end

    add_foreign_key :tickets, :users, column: :buyer_id, primary_key: :id
    add_foreign_key :tickets, :users, column: :seller_id, primary_key: :id

  end
end
