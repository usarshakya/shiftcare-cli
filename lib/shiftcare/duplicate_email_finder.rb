# frozen_string_literal: true

module Shiftcare
  # This provides functionality to find clients with duplicate email addresses.
  class DuplicateEmailFinder
    def self.find_duplicate_emails(clients)
      groups = clients.group_by { |c| c.email.to_s.downcase.strip }
      groups.select { |_, group| group.size > 1 }
    end
  end
end
