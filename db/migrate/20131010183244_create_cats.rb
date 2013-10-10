class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name, :null => false
      t.integer :age, :null => false
      t.datetime :birth_date, :null => false
      t.string :color, :null => false
      t.string :sex, :null => false, :limit => 1
      t.timestamps
    end
  end
end
