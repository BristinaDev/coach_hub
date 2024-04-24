class CoachingProgram < ApplicationRecord
  belongs_to :company
  has_many :coaches_coaching_program,  dependent: :destroy
  has_many :coaches, through: :coaches_coaching_program
  has_many :employees, dependent: :destroy
  has_many :assignments, dependent: :destroy
  
  validates :name, presence: true
end
