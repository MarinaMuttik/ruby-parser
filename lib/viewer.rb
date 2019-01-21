# Class to receive a log file and split the text into webpages and views
class Viewer
  def initialize(log)
    @log = File.read(log)
    @views = {}
  end

  # Splits the ip, but does not check for validity as numbers are usual ipv4
  # are a maximum 0-255 for each set which would fail for the provided
  # log. This can be added as a validation if required.
  def split_ipv4(log)
    log.scan(%r{\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}}).join
  end

  # Splits the webpage route in a format of "/xxx" with any number of
  # repetitions. If using webpages with https:// etc this would be adjusted
  def split_webpage(log)
    log.scan(%r{/[\w]{1,}}).join
  end

  # Splits based on webserver providing on a line by line basis. If in one block
  # of text, a regex of the above two methods could be combined to extract
  # each log of data
  def split_weblog
    @log.each_line do |line|
      webpage = split_webpage(line)
      ipv4 = split_ipv4(line)

      if @views[webpage].nil?
        @views.store(webpage, [ipv4])
      else
        @views[webpage] << ipv4
      end
    end
    @views
  end
end
