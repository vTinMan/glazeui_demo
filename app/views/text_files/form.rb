# frozen_string_literal: true

module TextFiles
  class Form < GlazeUI::BaseView
    type_register

    define_signal 'switching_form', nil, nil, nil, String

    attr_accessor :file_name, :text_content

    def render
      add Gtk::Box.new(:vertical) do
        add Common::Header.new('Files'), :header

        add Common::SplitView.new('Files', option_list), :split_view do
          place :pack_start, expand: true, fill: true
          add Gtk::Box.new(:vertical, 7), :file_content, pos(:pack_start, expand: true, fill: true) do
            add Gtk::TextView, :section_text do |section_text|
              place :pack_start, expand: true, fill: true
              section_text.editable = false
              fillin(section_text) unless text_content.to_a.empty?
            end
          end
        end
      end
    end

    def option_list
      @file_list ||= Dir["#{APP_PATH}/resources/files/*"]
      @option_list ||= @file_list.map { |path| File.basename(path) }
    end

    def fillin(section_text)
      section_text.buffer.create_tag('main_content',
                                     'wrap_mode' => :word,
                                     'size' => 12 * Pango::SCALE)
      iter = section_text.buffer.get_iter_at(offset: 0)
      text_content&.each do |line|
        section_text.buffer.insert(iter, line, tags: ['main_content'])
      end
    end
  end
end
