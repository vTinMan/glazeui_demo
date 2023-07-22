# frozen_string_literal: true

require 'glazeui'

APP_PATH = File.expand_path("#{File.dirname(__FILE__)}/..")

require File.join(%W[#{APP_PATH} config boot views.rb])
require File.join(%W[#{APP_PATH} config boot controllers.rb])

EXAMPLE_APP = GlazeUI::Application.new
EXAMPLE_APP.configurate do |config|
  config.main_view_class = MainView::Form
end

EXAMPLE_APP.run
