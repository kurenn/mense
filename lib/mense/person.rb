
# frozen_string_literal: true

module Mense
  class Person
    include Mense::Client

    def self.enrich(query = {})
      response = get('/person/enrich', query: query, headers: { "X-API-Key" => Mense.api_key })
      response
    end

  end
end
