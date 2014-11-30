require 'rails_helper'

RSpec.describe User, :type => :model do
  describe '#add_favorite' do
    subject { FactoryGirl.create(:user) }
    let(:list) { FactoryGirl.create(:list) }

    it 'updates the favorite_lists of the user' do
      expect { subject.add_favorite(list) }.to change { subject.favorite_lists.size }.by(1)
    end
  end
end
