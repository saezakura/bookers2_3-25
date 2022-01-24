class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      yut.integer :user_name
      t.string :text
      t.text :opinion
      t.timestamps
    end
  end
end
