# frozen_string_literal: true

module Common
  class SplitView < GlazeUI::BaseView
    type_register

    define_signal 'picked', nil, nil, nil, String

    attr_reader :header, :option_list

    def initialize(header, option_list)
      super()
      @header = header
      @option_list = option_list
    end

    def render
      add Gtk::Table.new(1, 2, true) do |table|
        table.set_column_spacing(14)
        table.set_border_width(7)

        add Gtk::TreeView.new(tree_model), :tree_view do |tree_view|
          place :attach, 0, 1, 0, 1
          tree_view.set_size_request(400, 600)
          renderer = Gtk::CellRendererText.new
          tree_view.insert_column(-1, header, renderer, 'text' => 0)
        end
        add Gtk::Box.new(:vertical, 7), :content_box, pos(:attach, 1, 2, 0, 1)
      end
    end

    def content_element
      content_box
    end

    def tree_model
      return @tree_model if defined? @tree_model

      @tree_model = Gtk::TreeStore.new(String)
      option_list.each do |path|
        iter = @tree_model.append(nil)
        iter[0] = File.basename(path)
      end
      @tree_model
    end
  end
end
