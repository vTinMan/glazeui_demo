# frozen_string_literal: true

module Common
  class HeaderController < GlazeUI::BaseController
    include Common::HeaderActivator

    def go_back(_btn)
      view.signal_emit('go_back', nil)
    end
  end
end
