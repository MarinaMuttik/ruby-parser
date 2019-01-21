require 'viewer'

# Class to initialize a formatted log from Viewer, create sorted hashes for
# views and display these results
class Parser
  def initialize(log)
    @viewer_log = Viewer.new(log).split_weblog
    @unique_views_hash = {}
    @total_views_hash = {}
    @webpage_views_hash = {}
  end

  def count_unique_views
    @viewer_log.each do |webpage, ipv4_arr|
      if @unique_views_hash[webpage].nil?
        @unique_views_hash.store(webpage, ipv4_arr.uniq.count)
      else
        @unique_views_hash[webpage] << ipv4_arr.uniq.count
      end
    end
    @unique_views_hash = sort_by_views(@unique_views_hash)
  end

  def count_total_views
    @viewer_log.each do |webpage, ipv4_arr|
      if @total_views_hash[webpage].nil?
        @total_views_hash.store(webpage, ipv4_arr.count)
      else
        @total_views_hash[webpage] << ipv4_arr.count
      end
    end
    @total_views_hash = sort_by_views(@total_views_hash)
  end

  # Method to combine total and unique views hashes to each route. As this
  # sorts by unique views and then total views this is not used for display
  # but is left as an avaible method if needed
  def webpage_views
    count_unique_views
    count_total_views
    @unique_views_hash.each do |webpage, unique|
      @webpage_views_hash.store(webpage, 'Unique views' => unique)
    end

    @total_views_hash.each do |webpage, total|
      @webpage_views_hash[webpage].store('Total views', total)
    end
    @webpage_views_hash
  end

  def sort_by_views(views_hash)
    views_hash.sort_by { |webpage, views| [-views, webpage] }.to_h
  end

  def display_by_views
    count_unique_views
    count_total_views

    puts 'Sorted by unique views:'
    @unique_views_hash.each do |webpage, views|
      puts webpage
      puts "Unique views: #{views}"
      puts "\n"
    end
    puts 'Sorted by total views:'
    @total_views_hash.each do |webpage, views|
      puts webpage
      puts "Total views: #{views}"
      puts "\n"
    end
  end
end
