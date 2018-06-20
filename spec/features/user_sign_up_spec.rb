feature 'signup' do
    scenario 'a user can signup' do

        Spaces.create(name_of_space: 'Lucys House', email: 'test@test.com', description: 'this is a house description for lucys house')
        visit('/')
        click_link('Sign Up')

        fill_in('email', with: 'test@mail.com')
        fill_in('password', with: 'password')
        fill_in('name', with: 'Bruce Bane')
        fill_in('username', with: 'The Hulk')

        click_button('submit')

        expect(page).to have_content("You are signed in as The Hulk")
    end
end
