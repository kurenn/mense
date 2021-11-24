# frozen_string_literal: true

require_relative "mense/version"

module Mense

  @@api_key = nil

  def self.api_key=(api_key)
    @@api_key = api_key
  end

  def self.api_key
    @@api_key
  end

  def self.configure
    yield self
  end
end

require_relative 'mense/client'
require_relative 'mense/person'
