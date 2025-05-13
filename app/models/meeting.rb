class Meeting < ApplicationRecord
  has_one :home_rider,  dependent: :destroy
  has_one :away_rider,  dependent: :destroy
  accepts_nested_attributes_for :home_rider, :away_rider
  validates :home_team, :away_team, :date, presence: true
end
