# ruby-parser

A program to receive a weblog of routes and IP views, and output these as a sorted list of most visited webpages to least.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Requires a recent Ruby version (I run 2.5.1) and RSpec to be installed.

To install Ruby and RVM, use the steps outlined [here](https://github.com/rvm/ubuntu_rvm).

To install RSpec, in the project root simply install the gem dependency with the following command:

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

## Test approach

### Tasks

* Initialize the project with Gemfile and RSpec using ```$ rspec --init```
* Start to write the tests based on an initial outline of tasks:
  1. Extract IP addresses and webpage routes into a hash which could then be counted into views for each page (this is covered in the Viewer class and specs).
  2. Creating a parser class to process the log data, count, and display it.
  3. Count unique views for each webpage route and store these in a hash.
  4. Count total views for each webpage route and store these in a hash.
  5. Combine this data into a hash for each webpage storing unique and total views together.
  6. Sort each unique and total views hash by descending viewcount, followed by alphabetical webpage name order.
  7. Output the data on the command line.
  8. Complete by refactoring where possible, using Rubocop to check code against style guide, add a README to repository.
* Used TDD throughout by starting off with a test, failing method, before writing the code in order to satisfy each test.

### Learning points

* Using a TDD approach was a relatively new concept to me however I found it useful having to outline the steps I would take by using tests first, and meaning that each step had already been tested as I went along without needing to figure out which method or step was failing if it were done as unit testing.
  * It also helped to set clear points at which to regularly commit than attempt large chunks at once without committing till they worked.
* Initially all instance methods were public, however at the end I refactored these to private, so only the display methods I needed to call directly were public.
  * As a result, I did have to retrospectively amend the RSpec tests for the private methods to #Test_object.send(method) in order for my original tests to remain valid.
  * This is a compromise made in order to secure the 'black box' nature of the display methods whilst preserving the original tests with only minor modifications to keep their original functioning.
* RSpec testing for output displayed on the command line wasn't something I'd ever tested for before so learning the use of heredoc and output was a useful new tool.
* The webpage views method was one I originally created before realizing that due to the test specifications, it was easier to keep total and unique views hashes separately in order to sort them both to meet the test specifications. As this and the display could still otherwise be useful I kept these in my program.
* Due to the lib folder not originally being within the load path, I had originally appended the lib folder path to the load path. On refactoring, I amended this to require_relative so I was not directly altering the load path.

### Possible improvements / development

* Sort webpage_views by either total or unique from user input on the command line.
* Display unique or total views from user input on the command line.
* Save the sorted data to a file.
* Add further IP validation within Viewer class.
