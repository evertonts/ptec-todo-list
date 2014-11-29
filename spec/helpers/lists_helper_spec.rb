require 'rails_helper'

RSpec.describe ListsHelper, :type => :helper do
  describe '#can_create_task_for' do
    let(:current_user) { FactoryGirl.create :user }
    let(:list) { FactoryGirl.create :list, user: user }

    before { allow(helper).to receive(:current_user) { current_user } }

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
end
