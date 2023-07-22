# frozen_string_literal: true

module Common
  class SplitViewController < GlazeUI::BaseController
    include Common::SplitViewActivator

    def pick_line(tree)
      picked = (tree.selected || [])[0]
      view.signal_emit('picked', picked)
    end
  end
end
