$LOAD_PATH << './lib'
require 'parser.rb'

weblog = Parser.new('./lib/test.log')
weblog.display_by_views
