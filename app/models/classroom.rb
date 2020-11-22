class Classroom < ApplicationRecord
  has_many :meetings, dependent: :destroy
  validates :name, presence: true, uniqueness: true

end
