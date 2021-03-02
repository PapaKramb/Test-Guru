class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :rules, null: false
      t.string :images, null: false

      t.timestamps
    end
  end
end
