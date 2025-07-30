# frozen_string_literal: true

require 'shiftcare'

RSpec.describe Shiftcare::CLI do
  it 'prints client info on search' do
    client = double(formatted_info: 'Client Info')
    allow(Shiftcare::Loader).to receive(:load).and_return([client])
    allow(Shiftcare::NameSearcher).to receive(:search).and_return([client])

    cli = described_class.new(%w[search query])
    expect { cli.run }.to output(/Client Info/).to_stdout
  end

  it 'prints duplicate clients info' do
    client1 = double(formatted_info: 'Client 1 info')
    client2 = double(formatted_info: 'Client 2 info')
    duplicates = { 'rasna@example.com' => [client1, client2] }

    allow(Shiftcare::Loader).to receive(:load).and_return([client1, client2])
    allow(Shiftcare::DuplicateEmailFinder).to receive(:find_duplicate_emails).and_return(duplicates)

    cli = described_class.new(['duplicates'])
    expect { cli.run }.to output(/Duplicate email: rasna@example.com/).to_stdout
  end

  it 'errors if search query missing' do
    cli = described_class.new(['search'])
    expect { cli.run }.to raise_error(SystemExit)
  end

  it 'shows instructions on unknown command' do
    cli = described_class.new(['foo'])
    expect { cli.run }.to output(/Instructions:/).to_stdout
  end
end
