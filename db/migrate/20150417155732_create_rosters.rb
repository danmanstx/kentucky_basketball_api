class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.references :team, index: true
      t.text :name
      t.text :height
      t.text :year
      t.integer :number
      t.text :hometown

      t.timestamps null: false
    end
    add_foreign_key :rosters, :teams
  end
end
