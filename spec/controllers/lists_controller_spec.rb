require 'rails_helper'

RSpec.describe ListsController, :type => :controller do
  describe 'GET #new' do
    context 'With a logged user' do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }

      it 'view the new list page' do
        get :new
        expect(subject).to render_template :new
      end
    end

    context 'Without a logged user' do
      it 'redirects to log_in page' do
        get :new
        expect(subject).to redirect_to new_user_session_path
      end
    end
  end
end
