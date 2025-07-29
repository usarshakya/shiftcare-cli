require 'json'

def load_clients(file)
  json = File.read(file)
  JSON.parse(json)
end

# Method to search client by full_name
def search_clients(clients, query)
  clients.select do |client|
    client['full_name'].to_s.downcase.include?(query.downcase)
  end
end

# Method to find_duplicate emails
def find_duplicate_emails(clients)
  groups = clients.group_by { |c| c['email'].to_s.downcase.strip }
  groups.select { |_, group| group.size > 1 }
end

command = ARGV[0]
clients = load_clients('clients.json')

if command == 'search' && ARGV[1]
  results = search_clients(clients, ARGV[1])
  results.each { |c| puts "ID:#{c['id']}, Full Name: #{c['full_name']}, Email: #{c['email']}" }
elsif command == 'duplicates'
  duplicates = find_duplicate_emails(clients)
  if duplicates.empty?
    puts 'There are no duplicate emails found'
  else
    duplicates.each do |email, group|
      puts "Duplicate email: #{email}"
      group.each { |c| puts "  - ID: #{c['id']}, Full Name: #{c['full_name']}" }
    end
  end
else
  puts 'Instructions:'
  puts '- For searching clients, run: ruby shiftcare.rb search <name>'
  puts '- For findind duplicate clients, run: ruby shiftcare.rb duplicates'
end
