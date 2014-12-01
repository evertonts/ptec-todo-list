module Features
  module SessionsHelper
    def sign_up_with(email, password)
      visit new_user_registration_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password, match: :prefer_exact
      fill_in 'Password confirmation', with: password, match: :prefer_exact

      click_button 'Sign up'
    end

    def sign_in(user)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end
  end
end
