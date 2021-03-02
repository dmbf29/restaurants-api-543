class ApplicationController < ActionController::Base
  # Devise
  before_action :authenticate_user!
  # Pundit

  # Parent Controller
end
