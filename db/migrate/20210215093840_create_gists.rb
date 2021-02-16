class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.string :url
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
