# frozen_string_literal: true

Dir["#{APP_PATH}/app/controllers/**/*.rb"].sort.each do |path_to_file|
  require path_to_file
end
