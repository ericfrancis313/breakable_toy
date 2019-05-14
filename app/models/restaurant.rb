class Restaurant < ApplicationRecord
  validates :distance, presence:true
  validates :review, presence:true
  validates :hours, presence:true
end
