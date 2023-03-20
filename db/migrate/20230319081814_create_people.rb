class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :name
      t.text :announcement
      t.integer :age
      t.belongs_to :admin

      t.timestamps
    end
  end
end
