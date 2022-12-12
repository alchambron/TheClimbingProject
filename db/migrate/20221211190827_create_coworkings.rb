class CreateCoworkings < ActiveRecord::Migration[7.0]
  def change
    create_table :coworkings do |t|
      t.string :title
      t.string :subtitle
      t.text :content
      t.belongs_to :center, foreign_key: true

      t.timestamps
    end
  end
end
