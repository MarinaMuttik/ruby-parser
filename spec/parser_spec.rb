require 'parser'

describe Parser do
  let (:parser_test) { Parser.new('./lib/test.log') }

  describe '.count_unique_views' do
    it "Returns a hash of webpages with unique views count" do
      parser_test.count_unique_views.should ==
        { "/help_page/1"=>3,
          "/contact"=>2,
          "/home"=>3,
          "/about/2"=>1,
          "/about"=>1 }
    end
  end
end
