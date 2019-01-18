require 'parser'

describe Parser do
  let (:parser_test) { Parser.new('./lib/test.log') }

  describe '.count_unique_views' do
    it "Returns a hash of webpages with unique views count" do
      expect(parser_test.count_unique_views).to eq (
        { "/help_page/1"=>3,
          "/contact"=>1,
          "/home"=>3,
          "/about/2"=>1,
          "/about"=>1 }
        )
    end
  end

  describe '.count_total_views' do
    it "Returns a hash of webpages with total views count" do
      expect(parser_test.count_total_views).to eq (
        { "/help_page/1"=>3,
          "/contact"=>2,
          "/home"=>3,
          "/about/2"=>1,
          "/about"=>1 }
        )
    end
  end

  describe '.webpage_views' do
    it "Returns a hash of webpages with hashes of unique and total view counts" do
      expect(parser_test.webpage_views).to eq (
      { "/help_page/1"=>{"Unique views"=>3, "Total views"=>3},
        "/contact"=>{"Unique views"=>1, "Total views"=>2},
        "/home"=>{"Unique views"=>3, "Total views"=>3},
        "/about/2"=>{"Unique views"=>1, "Total views"=>1},
        "/about"=>{"Unique views"=>1, "Total views"=>1} }
      )
    end
  end
end
