class Viewer
  def split_ipv4(log)
    ip = log.scan(/\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/).join
  end

  def split_webpage(log)
    webpage = log.scan(/\b(\/[\w]+{1,})/).join
  end
end
