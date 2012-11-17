require 'spec_helper'
require 'playfair_cipher'
require 'key_builder'

describe PlayfairCipher do
  let(:user_phrase) { "Playfajr example!" }
  let(:key_builder) { KeyBuilder.new user_phrase }

  subject { described_class.new user_phrase }

  describe :key do
    it 'returns the key used to encrypt' do
      subject.key.should == key_builder.key
    end
  end

  describe :pad_digraphs do
    it 'returns padded digraphs (with X) for repeated letters' do
      subject.send(:pad_digraphs, "OO").should == "OXO"
    end
    it 'returns padded digraphs (with X) for complex repeated letters' do
      subject.send(:pad_digraphs, "OOO").should == "OXOXO"
    end
  end

  describe :normalize_message do
    it 'removes unwanted/unsupported characters' do
      subject.send(:normalize_message, "aBC1 @#($").should == "ABC"
    end
    it 'replaces J with I' do
      subject.send(:normalize_message, "JJI").should == "III"
    end
  end

  describe :encrypt do
    it 'sanitizes messagess' do
      subject.encrypt('HI').should == 'BM'
      subject.encrypt('HI_#@$$^$%^$#%^$%^$%').should == 'BM'
    end

    context 'when digraph pairs are the same' do
      it 'pads digraphs with with X when both are the same' do
        subject.encrypt('OO').should == subject.encrypt('OXO')
      end
      it 'pads digraphs with X as many X as necessary' do
        subject.encrypt('OOO').should == subject.encrypt('OXOXOZ')
      end
      it 'pads string with Z as if the lenght is of the final string is odd' do
        subject.encrypt('OOO').should == subject.encrypt('OXOXOZ')
      end
    end

    context 'when letters are in the same row' do
      it 'should encrypt using the immediate right' do
        subject.encrypt('Hide the gold in the tree stump').should == "BMODZBXDNABEKUDMUIXMMOUVIF"
      end
    end
  end
end
