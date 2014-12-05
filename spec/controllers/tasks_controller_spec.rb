require 'rails_helper'

describe TasksController do
  describe 'POST #create' do
    context 'Does not create tasks on other users list' do
      let(:user) { FactoryGirl.create(:user, email: 'user2@mail.com') }
      let(:task) { FactoryGirl.create(:task, list: FactoryGirl.create(:list) ) }
      before do
        sign_in FactoryGirl.create(:user)
        request.headers['Accept'] = 'text/javascript'
      end

      it 'redirects to home' do
        expect do
         post :create, { 'task' => task.attributes }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
