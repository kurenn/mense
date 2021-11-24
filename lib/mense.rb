# frozen_string_literal: true

require_relative "mense/version"

module Mense

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
