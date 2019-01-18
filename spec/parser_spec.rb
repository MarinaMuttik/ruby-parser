require 'viewer'

describe Viewer do
  let(:log) { Viewer.new }

  describe '.split_ipv4' do
    it "Returns a valid IP of 4 numbers (<12 characters) seperated by 3 periods'" do
      log.split_ipv4('111.111.111.111/about').should == '111.111.111.111'
    end
  end
end
