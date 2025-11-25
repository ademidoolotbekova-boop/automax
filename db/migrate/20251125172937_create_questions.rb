class CreateQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :questions do |t|
      t.references :practice_test, null: false, foreign_key: true
      t.text :question_text, null: false
      t.string :question_type, default: 'multiple_choice'
      t.integer :position, null: false
      t.string :country
      t.string :image_url

      t.timestamps
    end

    add_index :questions, [:practice_test_id, :position]
    add_index :questions, :country
  end
end
