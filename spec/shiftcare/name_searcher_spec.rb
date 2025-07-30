require 'shiftcare/name_searcher'
require 'shiftcare/client'

RSpec.describe Shiftcare::NameSearcher do
  it 'finds clients matching the query (case-insensitive)' do
    clients = [
      Shiftcare::Client.new('id' => 1, 'full_name' => 'Rasna', 'email' => 'rasna@example.com'),
      Shiftcare::Client.new('id' => 2, 'full_name' => 'Meera', 'email' => 'meera@example.com')
    ]

    results = described_class.search(clients, 'rasna')
    expect(results.size).to eq(1)
    expect(results.first.full_name).to eq('Rasna')

    no_results = described_class.search(clients, 'zzz')
    expect(no_results).to be_empty
  end
end
