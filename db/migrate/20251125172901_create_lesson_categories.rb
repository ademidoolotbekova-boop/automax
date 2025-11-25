class CreateLessonCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :lesson_categories do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.text :description
      t.string :icon
      t.integer :position, null: false

      t.timestamps
    end

    add_index :lesson_categories, :slug, unique: true
    add_index :lesson_categories, :position
  end
end
