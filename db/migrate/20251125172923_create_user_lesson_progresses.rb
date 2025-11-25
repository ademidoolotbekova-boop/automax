class CreateUserLessonProgresses < ActiveRecord::Migration[8.0]
  def change
    create_table :user_lesson_progresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true
      t.boolean :completed, default: false, null: false
      t.datetime :started_at
      t.datetime :completed_at
      t.integer :time_spent_minutes, default: 0

      t.timestamps
    end

    add_index :user_lesson_progresses, [:user_id, :lesson_id], unique: true
  end
end
