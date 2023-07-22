# frozen_string_literal: true

class DescriptionController < GlazeUI::BaseController
  include Descriptions::FormActivator

  def go_back(_, _)
    view.signal_emit('switching_form', :Introduction)
  end

  def pick_section(_split_view, section_name)
    return unless section_name

    view.section_name = section_name
    view.refresh!(:section_text_box)
  end
end
