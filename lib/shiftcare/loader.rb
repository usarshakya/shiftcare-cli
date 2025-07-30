# frozen_string_literal: true

require 'json'

module Shiftcare
  # This loads client data from a JSON file and instantiates Client objects.
  class Loader
    def self.load(file)
      json = File.read(file)
      JSON.parse(json).map do |data|
        Shiftcare::Client.new(data)
      end
    end
  end
end
