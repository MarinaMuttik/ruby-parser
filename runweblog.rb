$LOAD_PATH << './lib'
require 'parser.rb'

weblog = Parser.new('./lib/webserver.log')
weblog.display_by_views
