class Company < ApplicationRecord
  has_many :coaching_programs, dependent: :destroy
  has_many :employees, dependent: :destroy

  validates :name, presence: true
end
