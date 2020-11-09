class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.timestamps
      t.string :post_code,      null: false
      t.integer :region_id,     null: false
      t.string :city,           null: false
      t.string :address,        null: false
      t.string :building
      t.string :phone_num,      null: false
      t.references :order,      foreign_key: true
    end
  end
end
