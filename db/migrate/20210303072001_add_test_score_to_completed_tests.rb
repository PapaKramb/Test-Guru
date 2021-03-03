class AddTestScoreToCompletedTests < ActiveRecord::Migration[6.0]
  def change
    add_column :completed_tests, :test_score, :integer
  end
end
