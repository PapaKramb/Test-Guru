class AddSuccessfullyColumnCompletedTest < ActiveRecord::Migration[6.0]
  def change
    add_column :completed_tests, :successfully, :boolean, default: false
  end
end
