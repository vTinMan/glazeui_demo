# frozen_string_literal: true

module Images
  module FormActivator
    extend GlazeUI::BaseActivator

    activate_view Images::Form

    active_elements :header, :split_view

    activation do
      header.signal_connect 'go_back', &method(:go_back)
      split_view.signal_connect 'picked', &method(:pick_image)
    end
  end
end
