class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.text :description
      t.decimal :started_at
      t.decimal :ended_at

      t.timestamps
    end
  end
end
