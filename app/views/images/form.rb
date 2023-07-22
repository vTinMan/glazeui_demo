# frozen_string_literal: true

module Images
  class Form < GlazeUI::BaseView
    type_register

    define_signal 'switching_form', nil, nil, nil, String

    attr_accessor :image_name

    def render
      add Gtk::Box.new(:vertical) do
        add Common::Header.new('Images'), :header

        add Common::SplitView.new('Images', option_list), :split_view do
          add Gtk::Box.new(:vertical, 7), :image_content do
            add Gtk::Image.new(pixbuf: image_buf) if image_name
          end
        end
      end
    end

    def option_list
      @file_list ||= Dir["#{APP_PATH}/resources/images/*"]
      @option_list ||= @file_list.map { |path| File.basename(path, '.*') }
    end

    def image_buf
      image_path = Dir["#{APP_PATH}/resources/images/#{image_name}.*"].first
      GdkPixbuf::Pixbuf.new(file: image_path)
    end
  end
end
