# frozen_string_literal: true

class ImagesController < GlazeUI::BaseController
  include Images::FormActivator

  def go_back(_, _)
    view.signal_emit('switching_form', :Introduction)
  end

  def pick_image(_split_view, image_name)
    return unless image_name

    view.image_name = image_name
    view.refresh!(:image_content)
  end
end
