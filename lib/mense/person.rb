
# frozen_string_literal: true

require_relative 'experience'
require_relative 'education'
require_relative 'profile'

module Mense
  class Person < Mense::Base
    class Email < Mense::Base; end

    coerce_key :experience, Array[Mense::Experience]
    coerce_key :education, Array[Mense::Education]
    coerce_key :profiles, Array[Mense::Profile]
    coerce_key :emails, Array[Mense::Person::Email]

    include Mense::Client

    attr_reader :likelihood

    def initialize(attributes = {})
      @likelihood = attributes["likelihood"]
      super(attributes["data"])
    end

    def self.enrich(params = {})
      response = get('/person/enrich', query: params, headers: { "X-API-Key" => Mense.api_key })

      self.new(response)
    end

    def self.search(params = {})
      response = get("/person/search", query: params, headers: { "X-API-Key" => Mense.api_key,
                                                                "Content-Type" => "application/json"})

      self.new(response)
    end

    def self.retrieve(id, params = {})
      response = get("/person/retrieve/#{id}", query: params, headers: { "X-API-Key" => Mense.api_key })

      self.new(response)
    end

    class <<self
      alias_method :find, :retrieve
    end
  end
end
