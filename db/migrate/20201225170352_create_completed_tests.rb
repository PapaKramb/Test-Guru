class CreateCompletedTests < ActiveRecord::Migration[6.0]
  def change
    create_table :completed_tests do |t|
      t.boolean :completed, null: false, default: false 
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
