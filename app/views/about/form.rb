# frozen_string_literal: true

module About
  class Form < GlazeUI::BaseView
    type_register

    define_signal 'switching_form', nil, nil, nil, String

    attr_accessor :section_name

    def render
      add Gtk::Box.new(:vertical) do
        add Common::Header.new('About'), :header

        add Gtk::Box.new(:vertical) do
          add Gtk::TextView do |text_view|
            place :pack_start, expand: true, fill: true
            text_view.editable = false
            fillin(text_view)
          end
        end
      end
    end

    def fillin(text_view)
      text_view.buffer.create_tag('heading',
                                  'weight' => :bold,
                                  'justification' => :center,
                                  'size' => 18 * Pango::SCALE)
      text_view.buffer.create_tag('main_content',
                                  'wrap_mode' => :word,
                                  'left_margin' => 20,
                                  'size' => 12 * Pango::SCALE)
      iter = text_view.buffer.get_iter_at(offset: 0)
      text_view.buffer.insert(iter, "About\n", tags: ['heading'])
      text_view.buffer.insert(iter, <<~TEXT, tags: ['main_content'])

        The application to demonstrate GlazeUI Framework functions
      TEXT
    end
  end
end
