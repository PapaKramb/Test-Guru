class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :images, null: false
      t.integer :rule_type, null: false
      t.integer :rule_value
  

      t.timestamps
    end
  end
end
