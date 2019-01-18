require 'viewer'

class Parser
  def initialize(log)
    @viewer_log = Viewer.new(log).split_weblog
    @unique_views_hash = {}
    @total_views_hash = {}
  end

  def count_unique_views
    @viewer_log.each do |webpage, ipv4_arr|
      if @unique_views_hash[webpage] == nil
        @unique_views_hash.store(webpage, ipv4_arr.uniq.count)
      else
        @unique_views_hash[webpage] << ipv4_arr.uniq.count
      end
    end
    @unique_views_hash
  end

  def count_total_views
    @viewer_log.each do |webpage, ipv4_arr|
      if @total_views_hash[webpage] == nil
        @total_views_hash.store(webpage, ipv4_arr.count)
      else
        @total_views_hash[webpage] << ipv4_arr.count
      end
    end
    @total_views_hash
  end

  def webpage_views
    'fail'
  end
end
