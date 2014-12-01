require 'rails_helper'

feature 'User mark user list as favorite' do
  let(:user) { list.user }
  let!(:list) { create(:list_with_user, id: 1) }

  scenario 'The list is not of the user', js: true do
    sign_up_with 'teste@example.com', '12345678'

    visit '/lists/1'
    click_link 'Add Favorite'

    expect(page).to have_content('Remove Favorite')
  end

  scenario 'The list is of the user' do
    sign_in user

    visit '/lists/1'

    expect(page).to_not have_content('Add Favorite')
  end

end
