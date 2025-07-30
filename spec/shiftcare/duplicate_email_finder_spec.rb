require 'shiftcare/duplicate_email_finder'
require 'shiftcare/client'

RSpec.describe Shiftcare::DuplicateEmailFinder do
  it 'finds clients with duplicate emails' do
    clients = [
      Shiftcare::Client.new('id' => 1, 'full_name' => 'George', 'email' => 'john@example.com'),
      Shiftcare::Client.new('id' => 2, 'full_name' => 'Dawa', 'email' => 'john@example.com'),
      Shiftcare::Client.new('id' => 3, 'full_name' => 'Jack', 'email' => 'rasna@example.com')
    ]

    duplicates = described_class.find_duplicate_emails(clients)
    expect(duplicates.keys).to include('john@example.com')
    expect(duplicates['john@example.com'].size).to eq(2)
    expect(duplicates).not_to include('rasna@example.com')
  end

  it 'returns empty hash if no duplicates' do
    unique_clients = [
      Shiftcare::Client.new('id' => 1, 'full_name' => 'Meera', 'email' => 'meera@example.com'),
      Shiftcare::Client.new('id' => 2, 'full_name' => 'Silva', 'email' => 'Silva@example.com')
    ]
    duplicates = described_class.find_duplicate_emails(unique_clients)
    expect(duplicates).to be_empty
  end
end
