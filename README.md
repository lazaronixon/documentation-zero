# Documentation Zero

The purpose of documentation zero is to generate a scaffold for rails api documentations using markdown.

## Example

You can see an example of the generated documentation [here](.documentation_api/README.md)

## Installation

Add this line to your application's Gemfile:

```ruby
gem "documentation-zero"
```

## Usage

```
rails generate documentation:readme
```

```
rails generate documentation:scaffold posts title:string body:text published:boolean
```

Add ```- [Posts](sections/posts.md)``` to API endpoints section.

## Development

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lazaronixon/documentation-zero. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/lazaronixon/documentation-zero/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DocumentationZero project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/lazaronixon/documentation-zero/blob/master/CODE_OF_CONDUCT.md).
