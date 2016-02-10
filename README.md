Environmenter
=============

Optionally load a Rails environment from other code. Processes which implement custom event loops may
wish to load Rails, for instance, to automatically configure database connections and provide access
to models.


## Usage

The basic usage instantiates an environmenter and loads it:

```ruby
require 'environmenter'
Environmenter::Loader.new.load!
```

In some cases one might wish to manually require other files in the load path:

```ruby
require 'environmenter'

config = {require: ['path/to/file']}
config = {'require' => ['path/to/file']}
config = OpenStruct.new(require: ['path/to/file'])

Environmenter::Loader.new(config).load!
```

Environmenter will not explode if Rails does not exist in the load path. It will attempt several different
methods of loading Rails, to support versions > 3.0.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/environmenter. This project is
ntended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to
the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

If attempting to load a version of Rails newer than that supported by this gem, please file an issue. Pull requests
are welcome, though note that the gem owner is picky about formatting and may ask for revisions. New features may
not be accepted, in a desire to keep this gem small with no external dependencies. This gem should only do one thing,
hopefully doing it well.


## Tests

```bash
bundle
bundle exec appraisal install
bundle exec appraisal rspec
```


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

