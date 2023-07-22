# frozen_string_literal: true

module About
  module FormActivator
    extend GlazeUI::BaseActivator

    activate_view About::Form

    active_elements :header

    activation do
      header.signal_connect 'go_back', &method(:go_back)
    end
  end
end
