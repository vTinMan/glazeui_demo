# frozen_string_literal: true

activators = Dir["#{APP_PATH}/app/views/**/*_activator.rb"]
forms = Dir["#{APP_PATH}/app/views/**/*.rb"] - activators

(forms + activators).each do |path_to_file|
  require path_to_file
end
