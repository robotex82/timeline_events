# frozen_string_literal: true

module TimelineEvents
  # Usage:
  #
  #     # app/controllers/application_controller.rb
  #     class ApplicationController < ActionController::Base
  #       view_helper TimelineEvents::ApplicationViewHelper, as: :timeline_helper
  #     end
  #
  class ApplicationViewHelper < Rao::ViewHelper::Base
    # Usage:
    #
    # Assume you have a collection of Timeline::Event in events. Then you can render
    # them like this:
    #
    #     # app/views/layouts/application.html.erb
    #     <%= timeline_helper(self).render(events) %>
    #
    def render(name, events, options = {})
      options.reverse_merge!(default_timeline_options)
      timeline_options = extract_timeline_options(options)
      options = options.except(default_timeline_options.keys)
      c.render partial: "timeline_events/application_view_helper/render", locals: { name: name, events: events, timeline_options: timeline_options, options: options }
    end

    private

      def extract_timeline_options(options)
        Hash[options.map { |k, v| ["data-#{k.to_s.dasherize}", v] }]
      end

      def default_timeline_options
        {
          mode:                      "vertical", # 'vertical', 'horizontal'
          force_vertical_width:      600,        # integer
          horizontal_start_position: "top",      # 'top', 'bottom'
          move_items:                1,          # integer
          start_index:               0,          # integer
          vertical_start_position:   "left",     # 'left', 'right'
          vertical_trigger:          "15%",      # percentage or pixel value e.g. '20%' or '150px'
          visible_items:             3,          # integer
          alternate_positions:       false,      # false, true
        }
      end
  end
end
