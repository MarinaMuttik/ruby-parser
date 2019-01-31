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

    sort_views(@unique_views_hash, "unique views")
    sort_views(@total_views_hash, "total views")
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
    puts "Sorted by #{string}:"
    scope.each do |webpage, views|
      puts webpage
      puts "#{string.capitalize}: #{views}"
      puts "\n"
    end
  end

  def count_unique_views
    count_views(@unique_views_hash, :uniq)
    @unique_views_hash = sort_by_views(@unique_views_hash)
  end

  def count_total_views
    count_views(@total_views_hash)
    @total_views_hash = sort_by_views(@total_views_hash)
  end

  def count_views(hash, method = nil)
    @viewer_log.each do |webpage, ipv4_arr|
      ipv4_count = if method.nil?
                     ipv4_arr.count
                   else
                     ipv4_arr.send(method).count
                   end

      if hash[webpage].nil?
        hash.store(webpage, ipv4_count)
      else
        hash[webpage] << ipv4_count
      end
    end
  end

  def sort_by_views(hash)
    hash.sort_by { |webpage, views| [-views, webpage] }.to_h
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
