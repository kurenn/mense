# frozen_string_literal: true

require 'httparty'

module Mense
  module Client
    def self.included(base)
      base.include HTTParty

      base.base_uri "https://api.peopledatalabs.com/v5"
    end

  end
end
