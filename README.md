# deep_sort

Sort Array/Hash/Enumerable recursively.

[![Gem Version](https://badge.fury.io/rb/deep_sort.svg)](https://badge.fury.io/rb/deep_sort)
[![Build Status](https://travis-ci.org/winebarrel/deep_sort.svg?branch=master)](https://travis-ci.org/winebarrel/deep_sort)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'deep_sort'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install deep_sort

## Additional methods

* `Array#deep_sort`
* `Array#deep_sort!`
* `Hash#deep_sort`
* `Hash#deep_sort!`

## Usage

```ruby
require 'deep_sort'
require 'pp'
require 'set'

hash = {"firstName"=>"John",
        "lastName"=>"Smith",
        "age"=>25,
        "address"=>
         {"streetAddress"=>"21 2nd Street",
          "city"=>"New York",
          "state"=>"NY",
          "postalCode"=>"10021"},
        "phoneNumber"=>
         [{"type"=>"home", "number"=>"212 555-1234"},
          {"type"=>"fax", "number"=>"646 555-4567"}],
        "gender"=>{"type"=>"male"},
        "number"=>[5, 4, 9, 7],
        "tags"=>Set["staff", "engineer", {"joined_at"=>"2016", "emp_no"=>10}, "writer"]}

pp hash.deep_sort
#=> {"address"=>
#     {"city"=>"New York",
#      "postalCode"=>"10021",
#      "state"=>"NY",
#      "streetAddress"=>"21 2nd Street"},
#    "age"=>25,
#    "firstName"=>"John",
#    "gender"=>{"type"=>"male"},
#    "lastName"=>"Smith",
#    "phoneNumber"=>
#     [{"number"=>"212 555-1234", "type"=>"home"},
#      {"number"=>"646 555-4567", "type"=>"fax"}],
#    "number" => [4, 5, 7, 9],
#    "tags"=>Set["staff", "engineer", {"joined_at"=>"2016", "emp_no"=>10}, "writer"]}
```

### `sort_enum: true`

```ruby
pp hash.deep_sort(sort_enum: true)
#=> {"address"=>
#     {"city"=>"New York",
#      "postalCode"=>"10021",
#      "state"=>"NY",
#      "streetAddress"=>"21 2nd Street"},
#    "age"=>25,
#    "firstName"=>"John",
#    "gender"=>{"type"=>"male"},
#    "lastName"=>"Smith",
#    "phoneNumber"=>
#     [{"number"=>"212 555-1234", "type"=>"home"},
#      {"number"=>"646 555-4567", "type"=>"fax"}],
#    "number" => [4, 5, 7, 9],
#    "tags"=>["engineer", "staff", "writer", {"emp_no"=>10, "joined_at"=>"2016"}]}
```
