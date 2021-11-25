# frozen_string_literal: true

module Mense
  class Company < Mense::Base
    class Location < Mense::Base; end

    coerce_key :location, Mense::Company::Location

    include Mense::Client

    def self.enrich(params = {})
      response = get('/company/enrich', query: params, headers: { "X-API-Key" => Mense.api_key,
                                                                "Content-Type" => "application/json"})

      self.new(response)
    end

    def self.clean(params = {})
      response = get('/company/clean', query: params, headers: { "X-API-Key" => Mense.api_key,
                                                                "Content-Type" => "application/json"})

      self.new(response)
    end

    def self.search(params = {})
      response = get("/company/search", query: params, headers: { "X-API-Key" => Mense.api_key,
                                                                "Content-Type" => "application/json"})

      response
    end
  end
end
