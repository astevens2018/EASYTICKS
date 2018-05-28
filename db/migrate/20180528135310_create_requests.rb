class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true, index: true
      t.text :preference

      t.timestamps
    end
  end
end
