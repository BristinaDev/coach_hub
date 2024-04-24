class Coaches::DashboardController < ApplicationController
  before_action :authenticate_coach!

  def index
    @coach = current_coach
    @coaching_sessions = filter_sessions(@coach.coaching_program.includes(:employees))
    @coaching_responsibilities = @coach.coaching_program.map(&:company)
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  
  def filter_sessions(coaching_program)
    sessions = coaching_program.page(params[:page])
    
    sessions = sessions.where("coaching_programs.name ILIKE ?", "%#{params[:coaching_program_name]}%") if params[:coaching_program_name].present?
    sessions = sessions.joins(:company).where("companies.name ILIKE ?", "%#{params[:company_name]}%") if params[:company_name].present?

    sessions
  end
    
end
