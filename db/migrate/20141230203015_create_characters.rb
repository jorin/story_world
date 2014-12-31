class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.text :description
      t.decimal :started_at
      t.decimal :ended_at

      t.timestamps
    end
  end
end
