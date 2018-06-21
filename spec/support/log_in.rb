
def log_in
  Users.create(email: 'lucy@example.com', password: 'password0', name: 'Lucy', username: 'lucygore')
  visit('/signin')
  fill_in('email', with: 'lucy@example.com')
  fill_in('password', with: 'password0')
  click_button('submit')
  end
