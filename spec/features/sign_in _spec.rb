feature 'authentication' do
  it 'an existing user can sign in'do
    Users.create(
      email: 'test@test.com', password: 'password',
      name: 'Harvey Dent', username: 'tswoface'
    )
    visit('/')
    click_link('Sign in')
    fill_in(:email, with 'test@test.com')
    fill_in(:password, with 'password')
    click_button('Sign in')
    expect(page).to have_content('Welcome, Twoface')

  end
end
