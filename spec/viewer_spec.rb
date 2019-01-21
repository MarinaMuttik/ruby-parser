require 'viewer'

describe Viewer do
  let(:log) { Viewer.new('./spec/shared/test.log') }

  # As these describe private methods these use .send to test these
  describe '#split_ipv4' do
    it 'Returns a valid IP of 4 sets of numbers (<12 characters)
    seperated by 3 periods' do
      expect(log.send(:split_ipv4, '111.111.111.111/about')).to eq(
        '111.111.111.111'
      )
    end
  end

  describe '#split_webpage' do
    it 'Returns a webpage route' do
      expect(log.send(:split_webpage, '111.111.111.111/about')).to eq(
        '/about'
      )
      expect(log.send(:split_webpage, '111.111.111.111/about/2')).to eq(
        '/about/2'
      )
    end
  end

  describe '#split_weblog' do
    it 'Returns a hash of webpages with ip views' do
      expect(log.split_weblog).to eq(
        '/help_page/1' =>
        ['126.318.035.038', '929.398.951.889', '543.910.244.929'],
        '/contact' =>
        ['184.123.665.067', '184.123.665.067'],
        '/home' =>
        ['184.123.665.067', '235.313.352.950', '316.433.849.805'],
        '/about/2' =>
        ['444.701.448.104'],
        '/about' =>
        ['061.945.150.735']
      )
    end
  end
end
