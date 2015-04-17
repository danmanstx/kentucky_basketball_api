class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.text :name
      t.text :location
      t.integer :founded
      t.text :mascot

      t.timestamps null: false
    end
  end
end
