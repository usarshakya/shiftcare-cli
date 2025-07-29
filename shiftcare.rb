require 'json'

def load_clients(file)
  json = File.read(file)
  JSON.parse(json)
end

def search_clients(clients, query)
  clients.select do |client|
    client['full_name'].to_s.downcase.include?(query.downcase)
  end
end

if ARGV[0] == 'search' && ARGV[1]
  clients = load_clients('clients.json')
  results = search_clients(clients, ARGV[1])
  results.each { |c| puts "id:#{c['id']}, full_name: #{c['full_name']}, email: #{c['email']}" }
else
  puts 'For Searching clients, run: ruby shiftcare.rb search <name>'
end
