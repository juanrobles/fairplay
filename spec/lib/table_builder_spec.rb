require 'spec_helper'

describe TableBuilder do

  let(:playfair_key) { "Playfajr example!" }
  let(:key) { "PLAYFIREXMBCDGHKNOQSTUVWZ" }

  context 'when given a key' do
    it 'can query table for full key' do
      tb = described_class.new playfair_key
      tb.full_key.should_not be_nil
    end
  end

end
