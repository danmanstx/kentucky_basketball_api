class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :home_team, index: true
      t.references :away_team, index: true
      t.integer :home_score
      t.integer :away_score
      t.integer :overtime
      t.integer :game_type
      t.date :date

      t.timestamps null: false
    end
    add_foreign_key :games, :home_teams
    add_foreign_key :games, :away_teams
  end
end
