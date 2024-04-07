class CreateRoutes < ActiveRecord::Migration[7.1]
  def change
    create_table :routes do |t|
      t.string :nameRoute
      t.string :startRoute
      t.string :endRoute

      t.timestamps
    end
  end
end
