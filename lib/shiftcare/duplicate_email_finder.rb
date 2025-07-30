module Shiftcare
  class DulicateEmailFinder
    def self.find_duplicate_emails(clients)
      groups = clients.group_by { |c| c.email.to_s.downcase.strip }
      groups.select { |_, group| group.size > 1 }
    end
  end
end
