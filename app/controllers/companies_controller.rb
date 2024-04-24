class CompaniesController < ApplicationController

  def show
    @company = Company.find(params[:id])
    @employee = Employee.new
    @coaching_programs = @company.coaching_programs
  end
 
  def register_user
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_root_path
    else
      flash[:error] = @employee.errors.full_messages
      redirect_to company_path(@employee.company)
    end
  end
 
  private

  def employee_params
    params.require(:employee).permit(:name, :email, :password, :coaching_requirements, :address,
    :coaching_program_id, :company_id, :coach_id)
  end


end
