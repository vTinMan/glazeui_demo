# frozen_string_literal: true

class IntroductionController < GlazeUI::BaseController
  include Introduction::FormActivator

  def switch_to(section, _btn)
    view.signal_emit('switching_form', section)
  end

  def quit_app(_)
    EXAMPLE_APP.quit
  end
end
