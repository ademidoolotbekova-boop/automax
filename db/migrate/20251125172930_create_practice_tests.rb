class CreatePracticeTests < ActiveRecord::Migration[8.0]
  def change
    create_table :practice_tests do |t|
      t.string :title, null: false
      t.text :description
      t.string :test_type, null: false
      t.integer :duration_minutes, null: false
      t.integer :questions_count, null: false
      t.integer :passing_score, null: false
      t.integer :position, null: false

      t.timestamps
    end

    add_index :practice_tests, :test_type
    add_index :practice_tests, :position
  end
end
