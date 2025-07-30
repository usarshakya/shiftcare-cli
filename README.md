# ShiftCare CLI

A simple command-line application to search clients and find duplicate emails from a given JSON dataset.

## Features

- Search clients by partial name match
- Find clients with duplicate email addresses
- Simple and easy-to-use CLI interface

## Project Structure

- `lib/shiftcare/` — Main code files (Client, Loader, NameSearcher, DuplicateEmailFinder, CLI)
- `spec/` — RSpec test files

## Requirements

- Ruby 2.5+ recommended
- Bundler to manage gems

## Setup

1. Clone the repository:

```
git clone git@github.com:usarshakya/shiftcare-cli.git
cd shiftcare-cli
```
2. Install dependencies:

```
bundle install
```
3. Place your clients JSON data file as `clients.json` in the project root or update the path in the code.

## Usage
Run the CLI commands like this:

- Search clients by name:

```
ruby lib/shiftcare.rb search <name>
```

Example:
```    
ruby lib/shiftcare.rb search Michael
```

- Find duplicate emails:

```bash
ruby lib/shiftcare.rb duplicates
```
- If you run without arguments or with unknown commands, instructions will be printed.

## Testing
Tests are written with RSpec.

To run the tests:

```bash
bundle exec rspec
```

### Notes
- The CLI depends on a JSON file (clients.json) containing client data.

### Refactor & Architecture Improvements
- Use dependency injection to make components easier to test and reuse.
- Add proper error handling for file not found, invalid JSON, and missing keys.
- Introduce logging for better debugging and observability.

### Feature Enhancements
- Make the JSON input file path configurable via CLI args or environment variables.
- Extend search to support other fields like email or ID.
