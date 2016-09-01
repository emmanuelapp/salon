#:nodoc
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    instance_variable_set("@#{controller_name}".to_sym, model_all)
  end

  private

  def model_all
    model.all
  end

  def model
    controller_name.singularize.camelize.constantize
  end
end
