# ruby-parser

A program to receive a weblog of routes and IP views, and output these as a sorted list of most visited webpages to least.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Requires Ruby version 2.5.1 and Rspec to be installed.

To install Ruby and RVM, use the steps outlined [here](https://github.com/rvm/ubuntu_rvm)
To install RSpec, in the project root simply install gem dependencies with the following command:

```
$ bundle install
```

### Running the tests

To run the RSpec tests, simply use the following command from the project folder root:

```
$ rspec
```

### Completing the test

To execute the program, you can use the ruby file to run through provided webserver.log

```
$ ruby runweblog.rb
```

Alternately, if using a different weblog, you may update the route in this file.
