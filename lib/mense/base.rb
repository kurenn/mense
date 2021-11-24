# frozen_string_literal: true

require 'hashie'

module Mense
  class Base < Hash
    include Hashie::Extensions::MergeInitializer
    include Hashie::Extensions::IndifferentAccess
    include Hashie::Extensions::MethodReader
    include Hashie::Extensions::DeepMerge
    include Hashie::Extensions::Coercion
  end
end
