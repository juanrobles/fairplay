require 'spec_helper'
require 'key_builder'

describe TableBuilder do

  let(:phrase) { "Playfajr example!" }
  let(:key_provider) { KeyBuilder.new phrase }

  describe :key do
    it 'can query for key' do
      tb = described_class.new key_provider
      tb.key.should == key_provider.key
    end
  end

end
