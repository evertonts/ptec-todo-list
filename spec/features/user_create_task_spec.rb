require 'rails_helper'

feature 'User add a task', js: true do
  before do
    sign_up_with 'valid@example.com', 'password'

    create_list 'Teste'
    visit '/lists/1'
  end

  scenario 'with a valid task' do
    fill_in 'Description', with: 'Task 1'
    click_button 'Create Task'

    expect(page).to have_content('Task 1')
  end

  scenario 'with a invalid task' do
    fill_in 'Description', with: ''
    click_button 'Create Task'

    expect(page).to have_content("Description can't be blank")
  end
end
