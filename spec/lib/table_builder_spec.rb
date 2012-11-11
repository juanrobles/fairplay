require 'spec_helper'
require 'key_builder'

describe TableBuilder do

  let(:phrase) { "Playfajr example!" }
  let(:key_builder) { KeyBuilder.new phrase }

  subject { described_class.new key_builder.key}

  describe :table do
    it 'should have a table' do
      subject.table.should be
    end

    it 'should contain 25 elements' do
      subject.table.size.should == 25
    end

  end

end
