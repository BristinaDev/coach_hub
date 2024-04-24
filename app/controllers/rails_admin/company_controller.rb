
class RailsAdmin::CompanyController < RailsAdmin::MainController

  def employees
    begin
      @company = Company.find(params[:id])
      @employees = @company&.employees
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end
  end
end
