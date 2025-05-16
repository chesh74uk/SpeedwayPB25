class Heat < ApplicationRecord
  belongs_to :meeting

  SCORE = [3,2,1,0]
end
