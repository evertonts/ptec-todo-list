require 'rails_helper'

RSpec.describe ListsHelper, :type => :helper do
  let(:current_user) { FactoryGirl.create :user }
  before { allow(helper).to receive(:current_user) { current_user } }

  describe '#can_create_task_for' do
    let(:list) { FactoryGirl.create :list, user: user }

    context 'when the current_user owns the list' do
      let(:user) { current_user }

      it 'returns true' do
        expect(helper.can_create_task_for(list)).to be_truthy
      end
    end

    context 'when the current_user does not owns the list' do
      let(:user) { FactoryGirl.create :user, email: 'user2@mail.com' }

      it 'returns false' do
        expect(helper.can_create_task_for(list)).to be_falsey
      end
    end
  end

  describe '#favorited_list' do
    let(:list) { FactoryGirl.create :list}

    context 'with the list on favorites' do
      before { current_user.favorite_lists.push(list) }

      it 'returns true' do
        expect(helper.favorited_list?(list)).to be_truthy
      end
    end

    context 'without the list on favorites' do
      it 'returns false' do
        expect(helper.favorited_list?(list)).to be_falsey
      end
    end
  end

  describe '#show_favorite?' do
    let(:list) { FactoryGirl.create :list, user: user }

    context 'user ows the list' do
      let(:user) { current_user }

      it 'returns false' do
        expect(helper.show_favorite?(list)).to be_falsey
      end
    end

    context 'other user owns the list' do
      let(:user) { FactoryGirl.create :user, email: 'test2@example.com' }

      it 'returns true' do
        expect(helper.show_favorite?(list)).to be_truthy
      end
    end
  end
end
