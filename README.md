[![Build Status](https://travis-ci.org/nanoc/nanoc-erector.png)](https://travis-ci.org/nanoc/nanoc-erector)
[![Code Climate](https://codeclimate.com/github/nanoc/nanoc-erector.png)](https://codeclimate.com/github/nanoc/nanoc-erector)
[![Coverage Status](https://coveralls.io/repos/nanoc/nanoc-erector/badge.png?branch=master)](https://coveralls.io/r/nanoc/nanoc-erector)

# nanoc-erector

This provides a filter for [Erector](http://erector.rubyforge.org/).

## Installation

`gem install nanoc-erector`

## Usage

```ruby
filter :erector
```

Options passed to this filter will be passed on to `Erector.render`.
