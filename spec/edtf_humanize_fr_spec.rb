require 'edtf-humanize'

RSpec.describe Edtf::Humanize do

  it { is_expected.to be_a(Module) }

  before(:each) do
    I18n.locale = :fr
  end

  context 'with a decade' do
    it 'should return a humanized decade string' do
      expect(Date.edtf('199x').humanize).to eq('Les années 1990')
    end
  end

  context 'with a centrury' do
    it 'should return a humanized century string' do
      expect(Date.edtf('19xx').humanize).to eq('XXe siècle')
    end
  end

  context 'with an interval' do
    it 'should return a humanized interval string' do
      expect(Date.edtf('1970/1980').humanize).to eq('De 1970 à 1980')
    end
  end

  context 'with an open interval' do
    it 'should return a humanized interval string' do
      expect(Date.edtf('1970/open').humanize).to eq('Depuis 1970')
    end
  end

  context 'with an appoximate interval'
  it 'should return a humanized approximate interval string' do
    expect(Date.edtf('1970~/1980~').humanize).to eq('De 1970 environ à 1980 environ')
  end

  context 'with an iso date' do
    it 'should return a humanized ISO date string' do
      expect(Date.edtf('1975-07-01').humanize).to eq('1 Juillet 1975')
    end
  end

  context 'with an uncertain iso date' do
    it 'should return a humanized uncertain ISO date string' do
      expect(Date.edtf('1975?').humanize).to eq('1975?')
    end
  end

  context 'with an unspecfic year iso date' do 
    it 'should return a humanized unspecified year ISO date string' do
      expect(Date.edtf('197u').humanize).to eq('197x')
    end
  end

  context 'with a season' do
    it 'should return a humanized season string' do
      expect(Date.edtf('1975-22').humanize).to eq('été 1975')
    end
  end

  context 'with a set' do 
    it 'should return a humanized set string' do
      expect(Date.edtf('[1980, 1981, 1983]').humanize).to eq('1980, 1981 ou 1983')
    end
  end

  context 'with an unknown value' do
    it 'should return a humanized unknown string' do
      expect(Date.edtf('uuuu').humanize).to eq('unknown')
    end
  end
end
