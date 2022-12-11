class CreateLoisirs < ActiveRecord::Migration[7.0]
  def change
    create_table :loisirs do |t|

      t.string :title
      t.string :subtitle
      t.text :content
      t.belongs_to :center, foreign_key: true
      t.timestamps
    end
  end
end
