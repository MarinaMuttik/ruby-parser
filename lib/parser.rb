require_relative 'viewer'

# Class to initialize a formatted log from Viewer, create sorted hashes for
# views and display these results
class Parser
  def initialize(log)
    @viewer_log = Viewer.new(log).split_weblog
    @unique_views_hash = {}
    @total_views_hash = {}
    @webpage_views_hash = {}
  end

  # Method to display views sorted by unique views, then again by total views
  def display_by_views
    count_unique_views
    count_total_views

    sort_views(@unique_views_hash, "Unique views")
    sort_views(@total_views_hash, "Total views")
  end

  # Method to display webpage_views - this is not part of the final test but
  # left as an available method (sorted by unique views)
  def display_webpage_views
    webpage_views
    puts 'Overall webpage views'
    puts "\n"
    @webpage_views_hash.each do |webpage, view_hash|
      puts webpage
      puts "#{view_hash.values[0]} unique views"
      puts "#{view_hash.values[1]} total views"
      puts "\n"
    end
  end

  private

  def sort_views(scope, string)
    puts "Sorted by #{string}"
    scope.each do |webpage, views|
      puts webpage
      puts "#{string}: #{views}"
      puts "\n"
    end
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

  def sort_by_views(views_hash)
    views_hash.sort_by { |webpage, views| [-views, webpage] }.to_h
  end

  # Method to combine total and unique views hashes to each route. As this
  # sorts by unique views it is simply an additional method above original task
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
end
