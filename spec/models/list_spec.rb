require 'rails_helper'

RSpec.describe List, :type => :model do
  it { is_expected.to validate_presence_of :name }

  describe '.open' do
    before do
      FactoryGirl.create(:list, particular: true)
      FactoryGirl.create(:list, particular: false)
    end

    it 'Only returns public lists' do
      expect(described_class.open).to have(1).list
    end
  end
end
