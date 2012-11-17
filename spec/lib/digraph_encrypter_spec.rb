require 'spec_helper'
require 'key_builder'

describe DigraphEncrypter do

  let(:phrase) { "Playfajr example!" }
  let(:key_builder) { KeyBuilder.new phrase }
  let(:key) { "PLAYF" +
              "IREXM" +
              "BCDGH" +
              "KNOQS" +
              "TUVWZ" }

  subject { described_class.new key_builder.key}

  describe :table do
    it 'should have a table' do
      subject.table.should be
    end

    it 'should contain 25 elements' do
      subject.table.size.should == 25
    end
  end

  describe :encrypt do

    context 'when digraph is in the same row' do
      it 'picks items to the right of each letter' do
        subject.encrypt('HI').should == 'BM'
      end
      it 'picks leftmost item when encrypting the last item (i.e. handles overflow)' do
        subject.encrypt('ZP').should == 'TF'
      end
    end
    context 'when digraph is in the same column' do
      it 'picks items below each letter' do
        subject.encrypt('DE').should == 'OD'
      end
      it 'picks top item when encrypting the last item (i.e. handles overflow)' do
        subject.encrypt('OV').should == 'VA'
        subject.encrypt('ZW').should == 'TZ'
      end
    end
    context 'when digraph forms a rectangle' do
      it 'picks items below each letter' do
        subject.encrypt('DE').should == 'OD'
        subject.encrypt('OL').should == 'NA'
        subject.encrypt('TH').should == 'ZB'
      end
    end
  end

end
