class Viewer
  def initialize(log)
    @log = File.read(log)
    @views = {}
  end

  def split_ipv4(log)
    ip = log.scan(/\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/).join
  end

  def split_webpage(log)
    webpage = log.scan(/(\/[\w]{1,})/).join
  end

  def split_weblog
    @log.each_line do |line|
      webpage = split_webpage(line)
      ipv4 = split_ipv4(line)

      if @views[webpage] == nil
        @views.store(webpage, [ipv4])
      else
        @views[webpage] << ipv4
      end
    end
    @views
  end
end
