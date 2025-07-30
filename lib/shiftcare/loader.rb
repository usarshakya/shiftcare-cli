require 'json'

module Shiftcare
  class Loader
    def self.load(file)
      json = File.read(file)
      JSON.parse(json).map do |data|
        Shiftcare::Client.new(data)
      end
    end
  end
end
