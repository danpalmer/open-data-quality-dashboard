class CreateScoresScoreCriteria < ActiveRecord::Migration
  def change
    create_table :scores_score_criteria do |t|
      t.integer :score_id
      t.integer :score_criteria_id
    end

    add_index :scores_score_criteria, [:score_id, :score_criteria_id]
  end
end
