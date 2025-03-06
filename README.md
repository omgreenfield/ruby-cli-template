This template is for building a Ruby CLI using [Thor](https://github.com/rails/thor) and some other goodies:

- An extension (`omg-thor-ext`) to make Thor behave more like other CLIs (see [Matt Brictson's blog about it](https://mattbrictson.com/blog/fixing-thor-cli-behavior))
- Helper scripts
  - `bin/install`: installs dependencies and copies `.env.example` to `.env`
  - `bin/console`: runs a `pry` console with everything in `src` loaded
  - `bin/cli`: loads up the CLI

## (1) Create new repo from template

```sh
gh repo create your-name/your-new-cli-repo --public --template=omgreenfield/ruby-cli-template
```

## (2) Preparation

Go through `Gemfile` and uncomment gems you want to include

## (3) Installation

```sh
bin/install
```

## (3) Usage

```sh
bin/console
bin/cli help
```

### (3.1) Example

```sh
# Just the 1 required argument
bin/cli example "required arg"

# The 1 required argument and 1 optional argument
bin/cli example "required arg" "optional arg"

# The 1 required argument, 1 optional argument, and some named args
bin/cli example "required arg" "optional arg" -s "named string" -n 123 -b
```

## (4) Testing

```sh
rspec
# or
bundle exec rspec
```



