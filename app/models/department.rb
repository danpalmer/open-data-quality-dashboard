class Department < ActiveRecord::Base
    has_many :scores
    has_many :resources
end
