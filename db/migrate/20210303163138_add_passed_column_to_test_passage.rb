class AddPassedColumnToTestPassage < ActiveRecord::Migration[6.0]
  def change
    add_column :completed_tests, :passed, :boolean, default: false
  end
end
