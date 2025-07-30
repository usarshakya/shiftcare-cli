module Shiftcare
  class NameSearcher
    def self.search(clients, query)
      clients.select do |client|
        client.full_name.to_s.downcase.include?(query.downcase)
      end
    end
  end
end
