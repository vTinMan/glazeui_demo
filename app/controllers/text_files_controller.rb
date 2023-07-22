# frozen_string_literal: true

class TextFilesController < GlazeUI::BaseController
  include TextFiles::FormActivator

  def go_back(_, _)
    view.signal_emit('switching_form', :Introduction)
  end

  def pick_file(_split_view, file_name)
    return unless file_name

    load_file_content(file_name)
    view.refresh!(:file_content)
  end

  def load_file_content(file_name)
    view.file_name = file_name
    view.text_content = []
    file_path = "#{APP_PATH}/resources/files/#{file_name}"
    File.foreach(file_path) do |line|
      view.text_content << line
    end
  end
end
