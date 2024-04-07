class CreateTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :trips do |t|
      t.references :route, foreign_key: {on_delete: :cascade, on_update: :cascade} 
      t.string :nameTrip
      t.date :startDate
      
      t.timestamps
    end
  end
end
