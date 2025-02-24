# frozen_string_literal: true

require 'securerandom'

# Module for generating unique codes for different models
module Utils
  module UniqueCodeGenerator
    # Generates a unique code for a given model and attribute
    #
    # @param model [ActiveRecord::Base, nil] The model class for which the unique code is generated
    # @param attribute [Symbol, nil] The attribute of the model to which the unique code is assigned
    # @param check_exists [Boolean] Whether to check for the existence of the generated code
    # @return [String] The generated unique code
    def self.generate(model: nil, attribute: nil, length: 9, check_exists: true)
      loop do
        role_code = SecureRandom.hex(length)
        break role_code unless check_exists && model && attribute
        break role_code unless model.exists?(attribute => role_code)
      end
    end
  end
end
