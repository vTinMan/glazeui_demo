# frozen_string_literal: true

class MainController < GlazeUI::BaseController
  include MainView::FormActivator

  def switch_form(_, section)
    view.section = section
    view.refresh!(:container)
  end
end
