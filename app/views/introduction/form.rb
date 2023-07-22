# frozen_string_literal: true

module Introduction
  class Form < GlazeUI::BaseView
    type_register

    define_signal 'switching_form', nil, nil, nil, String

    attr_accessor :section_name

    def render
      add Gtk::Box.new(:vertical) do
        add Common::Header.new('GlazeUI example application', no_back_btn: true)

        add Gtk::Box.new(:vertical) do
          place :pack_start, expand: false, fill: false

          add Gtk::Button.new(label: 'Help'), :descriptions_btn
          add Gtk::Button.new(label: 'Files'), :files_btn
          add Gtk::Button.new(label: 'Images'), :images_btn
          add Gtk::Button.new(label: 'About'), :about_btn
          add Gtk::Button.new(label: 'Quit'), :quit_btn
        end
      end
    end
  end
end
