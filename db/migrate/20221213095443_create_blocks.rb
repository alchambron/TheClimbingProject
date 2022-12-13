class CreateBlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :blocks do |t|
      t.string :title
      t.string :subtitle
      t.text :content
      t.timestamps
    end
  end
end
