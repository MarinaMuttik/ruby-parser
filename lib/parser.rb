require 'viewer'

class Parser
  def initialize(log)
    @viewer_log = Viewer.new(log).split_weblog
    @views_hash = {}
  end

  def count_unique_views
    @viewer_log.each do |webpage, ipv4_arr|
      if @views_hash[webpage] == nil
        @views_hash.store(webpage, ipv4_arr.count)
      else
        @views_hash[webpage] << ipv4_arr.count
      end
    end
    @views_hash
  end
end
