class CreateLessons < ActiveRecord::Migration[8.0]
  def change
    create_table :lessons do |t|
      t.references :lesson_category, null: false, foreign_key: true
      t.string :title, null: false
      t.string :slug, null: false
      t.integer :duration_minutes, null: false
      t.integer :position, null: false
      t.text :introduction
      t.json :sections
      t.json :key_points
      t.string :quiz_preview
      t.json :country_specific_content

      t.timestamps
    end

    add_index :lessons, :slug, unique: true
    add_index :lessons, [:lesson_category_id, :position]
  end
end
