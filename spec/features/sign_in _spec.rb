feature 'authentication' do
  it 'an existing user can sign in' do
    Users.create(
      email: 'lucy@example.com', password: 'password0',
      name: 'Lucy', username: 'lucygore'
    )
    visit('/')
    click_link('Sign In')
    wait_for_ajax
    fill_in('emailLogIN', with: 'lucy@example.com')
    fill_in('password', with: 'password0')
    click_button('submit')

    expect(page).to have_content("LUCYGORE")

  end

  it 'gives an error if the user does not exist' do
    Users.create(
      email: 'lucy@example.com', password: 'password',
      name: 'Lucy', username: 'lucygore'
    )
    visit('/')
    click_link('Sign In')
    fill_in('emailLogIN', with: 'lucyg@example.com')
    fill_in('password', with: 'password0')
    click_button('submit')

    expect(page).to have_content("Incorrect login details.")

  end
  it 'a user can sign out' do
    Users.create(
      email: 'lucy@example.com', password: 'password0',
      name: 'Lucy', username: 'lucygore'
    )
    visit('/')
    click_link('Sign In')
    fill_in('emailLogIN', with: 'lucy@example.com')
    fill_in('password', with: 'password0')
    click_button('submit')

    click_link('Sign Out')

    expect(page).not_to have_content("You are signed in as lucygore")
    expect(page).to have_link("Sign In")

  end
end
