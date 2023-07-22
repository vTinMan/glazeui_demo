# frozen_string_literal: true

module MainView
  module FormActivator
    extend GlazeUI::BaseActivator
    activate_view MainView::Form

    active_elements :content_form

    activation :container do
      content_form.signal_connect 'switching_form', &method(:switch_form)
    end
  end
end
