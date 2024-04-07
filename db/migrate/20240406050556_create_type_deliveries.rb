class CreateTypeDeliveries < ActiveRecord::Migration[7.1]
  def change
    create_table :type_deliveries do |t|
      t.string :typeDelivery

      t.timestamps
    end  
  end
end