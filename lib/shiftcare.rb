require_relative 'shiftcare/client'
require_relative 'shiftcare/loader'
require_relative 'shiftcare/name_searcher'
require_relative 'shiftcare/duplicate_email_finder'

module ShiftCare
  class CLI
    def initialize(args)
      @args = args
    end

    def run
      command = @args[0]
      case command
      when 'search'
        query = @args[1]
        if query.nil?
          puts 'Search term is required.'
          exit 1
        end
        clients = Shiftcare::Loader.load('clients.json')
        results = Shiftcare::NameSearcher.search(clients, query)
        results.each { |client| puts client.formatted_info }
      when 'duplicates'
        clients = Shiftcare::Loader.load('clients.json')
        dups = Shiftcare::DulicateEmailFinder.find_duplicate_emails(clients)
        if dups.empty?
          puts 'There are no duplicate emails found'
        else
          dups.each do |email, group|
            puts "Duplicate email: #{email}"
            group.each { |client| puts client.formatted_info }
          end
        end
      else
        puts 'Instructions:'
        puts '- For searching clients, run: ruby shiftcare.rb search <name>'
        puts '- For findind duplicate clients, run: ruby shiftcare.rb duplicates'
      end
    end
  end
end

ShiftCare::CLI.new(ARGV).run if __FILE__ == $0
