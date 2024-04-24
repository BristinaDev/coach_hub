class EmployeeAssignment < ApplicationRecord
  belongs_to :employee
  belongs_to :assignment
end
