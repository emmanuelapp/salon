require 'simplecov'

SimpleCov.start 'rails' do
  add_group 'Dashboard controllers', './app/controllers/dashboard'
  add_group 'Form object classes', './app/forms'
  add_group 'Queries', './app/queries'
end

ENV['RAILS_ENV'] ||= 'test'

require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'capybara/rspec'

ActiveRecord::Migration.maintain_test_schema!

require 'selenium/webdriver'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w[headless disable-gpu] }
  )

  Capybara::Selenium::Driver.new app,
                                 browser: :chrome,
                                 desired_capabilities: capabilities
end

Capybara.javascript_driver = :headless_chrome

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include FactoryBot::Syntax::Methods
end

def login_user
  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    user = create(:user)
    sign_in user
  end
end
