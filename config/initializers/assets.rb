# frozen_string_literal: true

Rails.application.config.assets.precompile += %w( timeline_events.css timeline_events.css )
Rails.application.config.assets.precompile += %w(
  vendor/arrow-left.svg
  vendor/arrow-right.svg
  vendor/timeline.min.css
  vendor/timeline.min.js
)
