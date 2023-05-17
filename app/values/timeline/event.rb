# frozen_string_literal: true

module Timeline
  class Event
    attr_accessor :title, :description, :happened_at, :color

    def initialize(attributes)
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def title
      @title ||= I18n.t("classes.#{self.class.name.underscore}")
    end

    def description
      @description ||= self.inspect
    end

    def color
      @color ||= "white"
    end

    def <=>(other)
      happened_at <=> other.happened_at
    end
  end
end
