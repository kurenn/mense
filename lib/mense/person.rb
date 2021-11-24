
# frozen_string_literal: true

require_relative 'experience'

module Mense
  class Person < Mense::Base
    coerce_key :experience, Array[Mense::Experience]

    include Mense::Client

    attr_reader :likelihood

    def initialize(attributes = {})
      @likelihood = attributes["likelihood"]
      super(attributes["data"])
    end

    def self.enrich(query = {})
      response = get('/person/enrich', query: query, headers: { "X-API-Key" => Mense.api_key })

      self.new(response)
    end

    def self.retrieve(id, query = {})
      response = get("/person/retrieve/#{id}", query: query, headers: { "X-API-Key" => Mense.api_key })

      self.new(response)
    end

    class <<self
      alias_method :find, :retrieve
    end
  end
end
