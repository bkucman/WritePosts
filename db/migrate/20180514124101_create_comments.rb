class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :desc
      t.boolean :published

      t.timestamps
    end
  end
end
