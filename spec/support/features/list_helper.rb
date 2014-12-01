module Features
  module ListHelper
    def create_list name
      visit new_list_path
      fill_in 'Name', with: name

      click_button 'Create List'
    end
  end
end
