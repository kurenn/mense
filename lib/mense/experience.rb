# frozen_string_literal: true

module Mense
  class Experience < Mense::Base

    class Company < Mense::Base
      class Location < Mense::Base; end
      coerce_key :location, Location
    end

    coerce_key :company, Company
  end
end
