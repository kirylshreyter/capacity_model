# frozen_string_literal: true

module Calendar
  class Month
    attr_accessor :name, :year, :days

    def initialize(days, month, year)
      @name = month
      @days = days.select { |day| day.date.strftime('%B') == month && day.date.year == year }
    end

    def prepare_data(resource)
      days.sum do |day|
        day.prepare_data(resource)
      end
    end
  end
end
