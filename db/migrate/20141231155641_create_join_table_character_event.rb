class CreateJoinTableCharacterEvent < ActiveRecord::Migration
  def change
    create_table 'characters_events', :id => false do |t|
      t.column :character_id, :integer
      t.column :event_id, :integer
    end
  end
end
