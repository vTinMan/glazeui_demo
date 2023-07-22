# frozen_string_literal: true

module Common
  module SplitViewActivator
    extend GlazeUI::BaseActivator

    activate_view Common::SplitView

    active_elements :tree_view

    activation do
      tree_view.selection.signal_connect 'changed', &method(:pick_line)
    end
  end
end
