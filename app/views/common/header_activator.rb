# frozen_string_literal: true

module Common
  module HeaderActivator
    extend GlazeUI::BaseActivator

    activate_view Common::Header
    active_elements :go_back_btn

    activation do
      go_back_btn.signal_connect 'clicked', &method(:go_back)
    end
  end
end
