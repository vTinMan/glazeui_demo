# frozen_string_literal: true

module Introduction
  module FormActivator
    extend GlazeUI::BaseActivator

    activate_view Introduction::Form

    active_elements :descriptions_btn, :files_btn, :images_btn, :about_btn, :quit_btn

    activation do
      descriptions_btn.signal_connect 'clicked', &method(:switch_to).curry.call(:Descriptions)
      files_btn.signal_connect 'clicked', &method(:switch_to).curry.call(:TextFiles)
      images_btn.signal_connect 'clicked', &method(:switch_to).curry.call(:Images)
      about_btn.signal_connect 'clicked', &method(:switch_to).curry.call(:About)
      quit_btn.signal_connect 'clicked', &method(:quit_app)
    end
  end
end
