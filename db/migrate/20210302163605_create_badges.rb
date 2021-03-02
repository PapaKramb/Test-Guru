class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :rules
      t.string :images

      t.timestamps
    end
  end
end
