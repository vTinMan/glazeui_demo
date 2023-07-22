# frozen_string_literal: true

module Common
  class Header < GlazeUI::BaseView
    type_register

    define_signal 'go_back', nil, nil, nil, String

    attr_reader :title, :no_back_btn

    def initialize(title, options = {})
      super()
      @title = title
      @no_back_btn = options[:no_back_btn]
    end

    def render
      add Gtk::Box.new(:horizontal) do |hbox|
        hbox.style_context.add_provider(header_bg_css, Gtk::StyleProvider::PRIORITY_USER)

        add Gtk::Fixed, pos(:pack_start, expand: false, fill: false) do
          add Gtk::Image.new(pixbuf: logo)
          add Gtk::Label, pos(:put, 150, 15) do |label|
            label.set_markup <<-HTML
              <span size='15000' foreground='white'>
                #{title}
              </span>
            HTML
          end
          add Gtk::Button.new(label: '◀◀'), :go_back_btn, pos(:put, 165, 30) do
            hide if no_back_btn
          end
        end
      end
    end

    def logo
      GdkPixbuf::Pixbuf.new(file: "#{APP_PATH}/resources/logo.jpg")
    end

    def header_bg_css
      bg_css = Gtk::CssProvider.new
      bg_css.load(data: <<-CSS)
        box {
          background-image: -gtk-gradient (linear,
                    left top,
                    left bottom,
                    color-stop(0.0,#2578b7),
                    color-stop(1.00,#015b9e));
        }
      CSS
      bg_css
    end
  end
end
