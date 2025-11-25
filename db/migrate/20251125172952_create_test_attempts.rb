class CreateTestAttempts < ActiveRecord::Migration[8.0]
  def change
    create_table :test_attempts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :practice_test, null: false, foreign_key: true
      t.datetime :started_at
      t.datetime :completed_at
      t.integer :score
      t.integer :total_questions
      t.integer :correct_answers
      t.boolean :passed

      t.timestamps
    end
  end
end
