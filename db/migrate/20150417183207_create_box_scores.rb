class CreateBoxScores < ActiveRecord::Migration
  def change
    create_table :box_scores do |t|
      t.text :full_game
      t.text :play_by_play
      t.text :first_half
      t.text :second_half
      t.text :newspaper
      t.text :play_analysis

      t.timestamps null: false
    end
  end
end
