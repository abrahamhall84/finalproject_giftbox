class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :product
      t.integer :user_id
      t.integer :give_quantity
      t.integer :want_quantity
      t.string :pick_up
      t.string :drop_off

      t.timestamps null: false
    end
  end
end
