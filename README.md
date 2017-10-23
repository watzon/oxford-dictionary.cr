# Oxford Dictionary API

Simple shard that allows you to communicate with the Oxford Dictionary API. Before installing an configuring make sure to set up a free account on [their website](https://developer.oxforddictionaries.com/). You'll need an *api_id* and *api_key* to make this work.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  oxford_dictionary:
    github: watzon/oxford-dictionary.cr
    branch: master
```

and run `crystal deps`.

## Usage

```crystal
require "oxford_dictionary"

dict = OxfordDictionary.new("app_id", "app_key")
fjord = dict.define("fjord")

# fjord is now a pretty big object, to get to the
# actual definitions...

definitions = [] of String
results.each do |result|
    result.lexicalEntries.each do |le|
        le.entries.each do |entry|
            entry.senses.each do |sense|
                definitions += sense.definitions unless sense.definitions.nil?
            end
        end
    end
end
definitions.uniq!
```

## Development

Obviously this is not in it's ideal state, but I don't really know what it's ideal state would be. The [node](https://www.npmjs.com/package/oxford-dictionary) version offers pretty much the same API with the same response. If you feel like submitting a PR feel free to do so!

## Contributing

1. Fork it ( https://github.com/watzon/oxford-dictionary.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [watzon](https://github.com/watzon)  - creator, maintainer
