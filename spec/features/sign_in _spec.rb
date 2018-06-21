feature 'authentication' do
  it 'an existing user can sign in' do
    Users.create(
      email: 'test@test.com', password: 'password',
      name: 'Harvey Dent', username: 'Twoface'
    )
    visit('/')
    click_link('Sign In')
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'password')
    click_button('submit')

    expect(page).to have_content("You are signed in as Twoface")

  end

  it 'gives an error if the user does not exist' do
    Users.create(
      email: 'test@test.com', password: 'password',
      name: 'Harvey Dent', username: 'Twoface'
    )
    visit('/')
    click_link('Sign In')
    fill_in('email', with: 'tester@test.com')
    fill_in('password', with: 'password')
    click_button('submit')

    expect(page).to have_content("Incorrect login details.")

  end
  it 'a user can sign out' do
    Users.create(
      email: 'test@test.com', password: 'password',
      name: 'Harvey Dent', username: 'Twoface'
    )
    visit('/')
    click_link('Sign In')
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'password')
    click_button('submit')

    click_link('Sign Out')

    expect(page).not_to have_content("You are signed in as Twoface")
    expect(page).to have_link("Sign In")

  end
end
