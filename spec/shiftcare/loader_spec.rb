# frozen_string_literal: true

require 'shiftcare/loader'
require 'shiftcare/client'

RSpec.describe Shiftcare::Loader do
  it 'loads clients from JSON and returns Client objects' do
    json_data = '[{"id":1,"full_name":"Rasna","email":"rasna@example.com"}]'
    allow(File).to receive(:read).and_return(json_data)

    clients = described_class.load('dummy.json')
    expect(clients.length).to eq(1)
    expect(clients.first).to be_a(Shiftcare::Client)
    expect(clients.first.full_name).to eq('Rasna')
  end
end
