# Ramlstyle

Validates the a RAML file, runs lint rules against it, and produces HTML documentation.

## Installation

Clone this repository on your machine, install dependencies and install the command.

```sh
git clone https://github.com/mmorga/ramlstyle.git
bundle
sudo bundle exec rake install:local  # if you are using the system Ruby
bundle exec rake install:local   # if you are using a rbenv, rvm, etc
```



## Usage

Usage: `ramlstyle [options] file1 file2 ...`

Option               | Description
-------------------- | -----------
-v, --verbose        | Output more information
    --no-document    | Do not produce HTML documentation
    --no-lint        | Do not run linter rules
-o, --output-dir DIR | Write HTML documentation to DIR
    --version        | print the version
-h, --help           | Display this screen

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ramlstyle.

## Credits

1. Templates are derived from templates from [RAML2HTML](https://github.com/kevinrenskers/raml2html)
2. RAML is parsed with [raml_ruby](https://github.com/coub/raml_ruby) (with some modifications)

