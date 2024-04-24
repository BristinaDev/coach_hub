class Assignment < ApplicationRecord
  # belongs_to :employee
  belongs_to :coaching_program

  has_many :employee_assignments
  has_many :employees, through: :employee_assignments,  dependent: :destroy
end
