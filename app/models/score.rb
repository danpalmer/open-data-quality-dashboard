class Score < ActiveRecord::Base
  belongs_to :department
  has_many :score_criteria
end
