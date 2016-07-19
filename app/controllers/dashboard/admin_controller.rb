module Dashboard
  # This class contains functionality that is common for all admin controllers.
  class AdminController < ApplicationController
    layout 'dashboard'
    before_action :authenticate_user!
  end
end
