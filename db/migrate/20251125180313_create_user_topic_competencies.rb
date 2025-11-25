class CreateUserTopicCompetencies < ActiveRecord::Migration[8.0]
  def change
    create_table :user_topic_competencies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :lesson_category, null: false, foreign_key: true
      t.integer :correct_answers
      t.integer :total_attempts
      t.decimal :competency_score
      t.datetime :last_practiced_at

      t.timestamps
    end
  end
end
