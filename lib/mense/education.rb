# frozen_string_literal: true

module Mense
  class Education < Mense::Base

    class School < Mense::Base
      class Location < Mense::Base; end
      coerce_key :location, Location
    end

    coerce_key :school, School
  end
end
