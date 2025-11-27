class AddLanguageToLessonsAndTests < ActiveRecord::Migration[8.0]
  def change
    add_column :lesson_categories, :language, :string, default: 'en', null: false
    add_column :lessons, :language, :string, default: 'en', null: false
    add_column :practice_tests, :language, :string, default: 'en', null: false
    add_column :questions, :language, :string, default: 'en', null: false
    add_column :answers, :language, :string, default: 'en', null: false

    add_index :lesson_categories, :language
    add_index :lessons, :language
    add_index :practice_tests, :language
    add_index :questions, :language
  end
end
