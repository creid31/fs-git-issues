class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.string :url
      t.integer :number
      t.string :github_id

      t.timestamps
    end
  end
end
