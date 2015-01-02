class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.decimal :started_at
      t.decimal :ended_at
      t.references :location, index: true

      t.timestamps
    end
  end
end
