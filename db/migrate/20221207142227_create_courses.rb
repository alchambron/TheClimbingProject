class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.decimal :price
      t.datetime :start_time
      t.belongs_to :center, null: false, foreign_key: true
      t.integer :max_attendees

      t.timestamps
    end
  end
end
