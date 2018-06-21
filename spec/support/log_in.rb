
def log_in
  visit('/signup')

  fill_in('email', with: 'example1@example.com')
  fill_in('password', with: 'password0')
  fill_in('name', with: 'example')
  fill_in('username', with: 'example')
  click_button('submit')

  end
