require 'spec_helper'
require 'playfair_cipher'
require 'key_builder'

describe PlayfairCipher do
  let(:user_phrase) { "Playfajr example!" }
  let(:key_builder) { KeyBuilder.new user_phrase }

  subject { described_class.new user_phrase }

  describe :key do
    it 'properly returns the key used to encrypt' do
      subject.key.should == key_builder.key
    end
  end

  describe :encrypt do
    context 'when letters are in the same row' do
    subject { described_class.new ( user_phrase)  }
      it 'should encrypt using the immediate right' do
        subject.encrypt('HI').should == 'BM'
      end
    end
  end
end
