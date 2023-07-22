# frozen_string_literal: true

module Descriptions
  class Form < GlazeUI::BaseView
    type_register

    define_signal 'switching_form', nil, nil, nil, String

    attr_accessor :section_name

    HELP_TEXTS = {
      'Help' => 'It is this section appointed to provide short descriptions of application sections.',
      'Files' => 'The section to read content of files form directory \'resources/files\'',
      'Images' => 'The section to show pictures form \'resources/images\'.',
      'About' => 'The section giving the general information about application.'
    }.freeze

    def render
      add Gtk::Box.new(:vertical) do
        add Common::Header.new('Help'), :header

        add Common::SplitView.new('Sections', HELP_TEXTS.keys), :split_view do
          place :pack_start, expand: true, fill: true
          add Gtk::Box.new(:vertical, 7), :section_text_box, pos(:pack_start, expand: true, fill: true) do
            add_text_section
          end
        end
      end
    end

    def add_text_section
      add Gtk::TextView, :section_text do |section_text|
        place :pack_start, expand: true, fill: true
        section_text.editable = false
        section_text.buffer.create_tag('main_content', 'wrap_mode' => :word, 'size' => 12 * Pango::SCALE)
        iter = section_text.buffer.get_iter_at(offset: 0)
        section_text.buffer.insert(iter, HELP_TEXTS[section_name].to_s, tags: ['main_content'])
      end
    end
  end
end
