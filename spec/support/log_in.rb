
def log_in
  visit('/')
  click_link('Sign Up')

  fill_in('emailSignUp', with: 'example1@example.com')
  fill_in('passwordSignUp', with: 'password0')
  fill_in('nameSignUp', with: 'example')
  fill_in('userNameSignUp', with: 'example')
  click_button('submitSignUp')

  end
