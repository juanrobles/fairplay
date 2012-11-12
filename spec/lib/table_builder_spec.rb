require 'spec_helper'
require 'key_builder'

describe TableBuilder do

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
        subject.encrypt('EX').should == 'XM'
      end
      it 'picks leftmost item when encrypting the last item (i.e. handles overflow)' do
        subject.encrypt('GH').should == 'HB'
      end
    end
    context 'when digraph is in the same column' do
      it 'picks items below each letter' do
        subject.encrypt('DE').should == 'OD'
      end
      it 'picks top item when encrypting the last item (i.e. handles overflow)' do
        subject.encrypt('OV').should == 'VA'
      end
    end
  end

end
