class CreateDeliveries < ActiveRecord::Migration[7.1]
  def change
    create_table :deliveries do |t|
      t.references :trip, foreign_key: {on_delete: :cascade, on_update: :cascade} 
      t.references :status, foreign_key: {on_delete: :cascade, on_update: :cascade} 
      t.references :type_delivery, foreign_key: {on_delete: :cascade, on_update: :cascade} 
      t.text :description
      t.date :date
      t.string :location
      t.string :customer

      t.timestamps
    end
  end
end
