# Moblues [![Build Status](https://travis-ci.org/garriguv/moblues.svg)](https://travis-ci.org/garriguv/moblues) [![Code Climate](https://codeclimate.com/github/garriguv/moblues/badges/gpa.svg)](https://codeclimate.com/github/garriguv/moblues) [![Test Coverage](https://codeclimate.com/github/garriguv/moblues/badges/coverage.svg)](https://codeclimate.com/github/garriguv/moblues)

Generates files for entities defined in a Core Data model. Inspired by [mogenerator](https://github.com/rentzsch/mogenerator).

For each entity in the Core Data model, moblues will create two files: a machine file and a human file. The machine file will be overwritten each time and shouldn't be modified. Moblues will only create the human file if it doesn't exist.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'moblues'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install moblues

## Usage

```
Usage:
  moblues generate --human=HUMAN --machine=MACHINE --model=MODEL

Options:
  --model=MODEL      # CoreData model path
  --human=HUMAN      # Path where the human files will be stored
  --machine=MACHINE  # Path where the machine files will be stored

generate the machine and human files
```

## Contributing

1. Fork it ( https://github.com/garriguv/moblues/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
6. You're awesome! :+1:
