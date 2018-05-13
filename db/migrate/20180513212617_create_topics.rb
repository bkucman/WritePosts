class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :name
      t.string :desc
      t.boolean :published

      t.timestamps
    end
  end
end
