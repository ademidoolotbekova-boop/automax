class AddDifficultyToPracticeTests < ActiveRecord::Migration[8.0]
  def change
    add_column :practice_tests, :difficulty, :string, default: 'medium', null: false
    add_index :practice_tests, :difficulty
  end
end
