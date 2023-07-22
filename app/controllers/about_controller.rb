# frozen_string_literal: true

class AboutController < GlazeUI::BaseController
  include About::FormActivator

  def go_back(_, _)
    view.signal_emit('switching_form', :Introduction)
  end
end
