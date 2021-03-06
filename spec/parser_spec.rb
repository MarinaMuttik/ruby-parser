require 'parser'

describe Parser do
  let(:parser_test) { Parser.new('./spec/shared/test.log') }

  # As these describe private methods these use .send to test these
  describe '#count_unique_views' do
    it 'Returns a hash of webpages with unique views count' do
      expect(parser_test.send(:count_unique_views)).to eq(
        '/help_page/1' => 3,
        '/contact' => 1,
        '/home' => 3,
        '/about/2' => 1,
        '/about' => 1
      )
    end
  end

  describe '#count_total_views' do
    it 'Returns a hash of webpages with total views count' do
      expect(parser_test.send(:count_total_views)).to eq(
        '/help_page/1' => 3,
        '/contact' => 2,
        '/home' => 3,
        '/about/2' => 1,
        '/about' => 1
      )
    end
  end

  describe '#webpage_views' do
    it 'Returns a hash of webpages with hashes of unique and
    total view counts' do
      expect(parser_test.send(:webpage_views)).to eq(
        '/help_page/1' => { 'Unique views' => 3, 'Total views' => 3 },
        '/contact' => { 'Unique views' => 1, 'Total views' => 2 },
        '/home' => { 'Unique views' => 3, 'Total views' => 3 },
        '/about/2' => { 'Unique views' => 1, 'Total views' => 1 },
        '/about' => { 'Unique views' => 1, 'Total views' => 1 }
      )
    end
  end

  describe '#sort_by_views' do
    it 'Returns a hash of webpages by descending views and
    alphabetical pages' do
      expect(parser_test.send(:count_unique_views).keys[0]).to eq(
        '/help_page/1'
      )

      expect(parser_test.send(:count_unique_views).keys[-1]).to eq(
        '/contact'
      )

      expect(parser_test.send(:count_total_views).keys[0]).to eq(
        '/help_page/1'
      )

      expect(parser_test.send(:count_total_views).keys[-1]).to eq(
        '/about/2'
      )
    end
  end

  describe '#display_by_views' do
    it 'Displays results sorted by views' do
      expect { parser_test.display_by_views }.to output(
        <<~OUTPUT
          Sorted by unique views:
          /help_page/1
          Unique views: 3

          /home
          Unique views: 3

          /about
          Unique views: 1

          /about/2
          Unique views: 1

          /contact
          Unique views: 1

          Sorted by total views:
          /help_page/1
          Total views: 3

          /home
          Total views: 3

          /contact
          Total views: 2

          /about
          Total views: 1

          /about/2
          Total views: 1

        OUTPUT
      ).to_stdout
    end
  end

  describe '#display_webpage_views' do
    it 'Displays results sorted by unique then total views' do
      expect { parser_test.display_webpage_views }.to output(
        <<~OUTPUT
          Overall webpage views

          /help_page/1
          3 unique views
          3 total views

          /home
          3 unique views
          3 total views

          /about
          1 unique views
          1 total views

          /about/2
          1 unique views
          1 total views

          /contact
          1 unique views
          2 total views

        OUTPUT
      ).to_stdout
    end
  end
end
