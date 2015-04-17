class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :year
      t.text :coach
      t.text :conference
      t.text :division
      t.references :school, index: true

      t.timestamps null: false
    end
    add_foreign_key :teams, :schools
  end
end
