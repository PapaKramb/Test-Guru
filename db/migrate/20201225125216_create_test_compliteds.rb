class CreateTestCompliteds < ActiveRecord::Migration[6.0]
  def change
    create_table :test_compliteds do |t|
      t.boolean :complited, null: false, default: false 
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
