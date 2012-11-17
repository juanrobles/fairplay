require 'spec_helper'

describe KeyBuilder do
  let(:playfair_key) { "Playfajr example!" }
  let(:key) { "PLAYFIREXMBCDGHKNOQSTUVWZ" }

  context "when building a key using an empty phrases" do
    it 'returns a default key' do
      blank = described_class.new ""
      blank.key.should_not be_empty
    end
  end

  context 'when building a key using a nil phrase' do
    it 'returns default key' do
      blank = described_class.new nil
      blank.key.should_not be_empty
    end
  end

  context 'when building a key using a valid phrase' do
    it 'returns a properly formed key' do
      non_blank_key = described_class.new playfair_key
      non_blank_key.key.should == key
    end

    it 'cleans invalid characters passed in the phrase' do
      non_blank_key = described_class.new playfair_key
      non_blank_key.key.should_not  include('!')
    end
  end
end

