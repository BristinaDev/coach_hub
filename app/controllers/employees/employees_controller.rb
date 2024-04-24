class Employees::EmployeesController < ApplicationController
  before_action :authenticate_employee!
  
  def index
    @current_employee = current_employee
    @current_assignments = @current_employee.assignments
  end
end
