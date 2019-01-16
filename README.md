# I18nLinter

[![CircleCI](https://circleci.com/gh/rootstrap/i18n_linter/tree/master.svg?style=svg&circle-token=15c1ee79b304665b14e47e04dc7577c715de293c)](https://circleci.com/gh/rootstrap/i18n_linter/tree/master)

Internationalization linter for your Ruby on Rails projects.

## Installation
All you have to do is run the following command:
```bash
$ gem install i18n_linter
```
If you want to install using `bundler`, add this to the `Gemfile` under the `development` group:
```ruby
gem 'i18n_linter', require: false
```

## Usage
Just type `i18n_linter` in a Ruby on Rails project's folder and watch the strings that could be internationalized. Note: only strings in ruby files will be reported.
```
$ cd my/ruby_on_rails/project
$ i18n_linter [options]
```

## Options
The available options are:
```
-f PATTERN, --files=PATTERN     Pattern to find files, default: -f '**/*.rb'
-o FILE, --out=FILE,            Write output to a file instead of STDOUT
```

For example:

```
$ i18n_linter -f users_controller.rb
```
```
$ i18n_linter -f app/controllers/**/*.rb -o i18n_linter_output.txt
```

## Configuration
The behavior of I18nLinter can be controlled via the `.i18n_linter.yml` configuration file.
It's possible to enable or disable Rules and exclude files from the validations as follows:
```ruby
Linter:
  Include:
    - '**/*.rb'
  Exclude:
    - 'spec/**/*'
Rules:
  Uppercase:
    Enabled: true
  MiddleSpace:
    Enabled: false
```

## Example
Imagine a source file sample.rb containing:
```ruby
class UserController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def show
    @user = User.find(params[:id])
  end

  private

  def render_not_found
    render json: { error: "Couldn't find the record" }, status: :not_found
  end
end
```
I18nLinter will return the following warnings in this file:
```
$ i18n_linter -f sample.rb

sample.rb:11:26
10:    def render_not_found
11:      render json: { error: "Couldn't find the record" }, status: :not_found
12:    end
----------------
```

## Contributing
Bug reports (please use Issues) and pull requests are welcome on GitHub at https://github.com/rootstrap/i18n_linter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Credits
**I18nLinter** is maintained by [Rootstrap](http://www.rootstrap.com) with the help of our [contributors](https://github.com/rootstrap/i18n_linter/contributors).

[<img src="https://s3-us-west-1.amazonaws.com/rootstrap.com/img/rs.png" width="100"/>](http://www.rootstrap.com)
