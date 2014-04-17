Gacha
======================

Gacha is a library for Ruby to pick up the one with a specified probability from some items.

## Installation

Add this line to your application's Gemfile:

    gem 'gacha'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gacha

## Usage

Here is a simple example to pick up the item from 3 items which are Ruby, Python and Perl. Probability of each item is below.

- Ruby   : 55%
- Python : 20%
- Perl   : 25%

### Simple Example

```ruby
require 'gacha'

items = [
  Gacha::Item.new("Ruby", 55),
  Gacha::Item.new("Python", 20),
  Gacha::Item.new("Perl", 25),
]
items.each do |item|
  box.add(item)
end

item = box.draw
p item.id # Ruby or Python or Perl
```

### Consumable Item

if you want to use consumable item, you should write below code.

```ruby
require 'gacha'

items = [
  Gacha::Item.new("Ruby", 55),
  Gacha::Item.new("Python", 20),
  Gacha::Item.new("Perl", 25),
]
items.each do |item|
  box.add(item)
end
box.set_consumable(true)

p box.draw # Ruby or Python or Perl
p box.draw # Ruby or Python or Perl
p box.draw # Ruby or Python or Perl
p box.draw # nil
```

### Remove Item from Box
```ruby
item = Gacha::Item.new("test1", 30)
box.remove(item)
p box.empty? # true
p box.count  # 0
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/gacha/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
