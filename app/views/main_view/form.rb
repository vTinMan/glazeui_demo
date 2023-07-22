# frozen_string_literal: true

module MainView
  class Form < GlazeUI::BaseView
    attr_accessor :section

    def render
      add Gtk::Box.new(:vertical), :box do
        add Gtk::Box.new(:vertical), :container do
          add content, :content_form
        end
      end
    end

    def content
      if section
        Object.const_get(section).const_get(:Form)
      else
        Introduction::Form
      end
    end
  end
end
