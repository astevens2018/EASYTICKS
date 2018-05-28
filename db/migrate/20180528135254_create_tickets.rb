class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.references :user, foreign_key: true
      t.date :date
      t.time :time
      t.string :departing_city
      t.string :arrival_city
      t.integer :price
      t.string :booking_reference

      t.timestamps
    end
  end
end
