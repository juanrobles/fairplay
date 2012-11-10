require 'spec_helper'

describe KeyBuilder do
  let(:playfair_key) { "Playfajr example!" }
  let(:key) { "PLAYFIREXMBCDGHKNOQSTUVWZ" }

  context "for empty phrases" do
    it 'properly returns default key' do
      blank = described_class.new ""
      blank.key.should_not be_empty
    end
  end

  context 'for nil phrases' do
    it 'properly returns default key' do
      blank = described_class.new nil
      blank.key.should_not be_empty
    end
  end

  context 'for a valid phrase' do
    it 'returns a properly formed phrase' do
      non_blank_key = described_class.new playfair_key
      non_blank_key.key.should == key
    end

    it 'cleans invalid characters' do
      non_blank_key = described_class.new playfair_key
      non_blank_key.key.should_not  include('!')
    end
  end
end

