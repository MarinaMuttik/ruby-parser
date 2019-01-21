require_relative './lib/parser'

weblog = Parser.new('./lib/webserver.log')
weblog.display_by_views
weblog.display_webpage_views
