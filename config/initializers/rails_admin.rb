RailsAdmin.config do |config|
  config.asset_source = :sprockets
  
  config.model 'Company' do
    list do
      field :name
      field :description
      field :created_at
    end
  end

  config.model 'CoachingProgram' do
    list do
      field :name
      field :duration
    end
  end

  config.model 'Employee' do
    visible false
  end

  config.model 'Coach' do
    list do
      field :name
      field :expertise
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
  
    # Custom action for users
    member :employees do
      only ['Company']       
      controller do
        proc do
          @company = @object
          @employees = @company.employees
          render action: @action.template_name
        end
      end
      link_icon 'fa fa-eye'
    end
  end

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  # config.authorize_with do
  #   redirect_to main_app.root_path unless current_admin
  # end
  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit
  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true
end
