require 'shiftcare/client'

RSpec.describe Shiftcare::Client do
  it 'creates a client and returns formatted info' do
    attrs = { 'id' => 1, 'full_name' => 'Rasna', 'email' => 'rasna@example.com' }
    client = described_class.new(attrs)

    expect(client.id).to eq(1)
    expect(client.full_name).to eq('Rasna')
    expect(client.email).to eq('rasna@example.com')
    expect(client.formatted_info).to eq('ID:1, Full Name: Rasna, Email: rasna@example.com')
  end
end
