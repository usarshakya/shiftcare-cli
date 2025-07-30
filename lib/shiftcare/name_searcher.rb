# frozen_string_literal: true

module Shiftcare
  # This provides search functionality to find clients by full name.
  class NameSearcher
    def self.search(clients, query)
      clients.select do |client|
        client.full_name.to_s.downcase.include?(query.downcase)
      end
    end
  end
end
