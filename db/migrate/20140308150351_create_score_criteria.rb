class CreateScoreCriteria < ActiveRecord::Migration
  def change
    create_table :score_criteria do |t|
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
