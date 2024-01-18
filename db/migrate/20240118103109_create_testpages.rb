class CreateTestpages < ActiveRecord::Migration[7.0]
  def change
    create_table :testpages do |t|
      t.string :name 
      t.integer :count 
      t.text :description

      t.timestamps
    end
  end
end
