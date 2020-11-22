class Meeting < ApplicationRecord
  validates :start_time, uniqueness: { scope: :classroom }
  validates :user_id, presence: true
  validates :classroom_id, presence: true
  belongs_to :classroom
  belongs_to :user
end
