feature 'request a space' do
    scenario 'a user can request a space using email details' do

        Spaces.create(name_of_space: 'Lucys House', email: 'test@test.com', description: 'this is a house description for lucys house')
        visit('/')
        click_button('Sign Up')

        fill_in('email', with: 'test@mail.com')
        fill_in('password', with: 'password')
        fill_in('name', with: 'Bruce Bane')
        fill_in('username', with: 'The Hulk')

        click_button('Sign Up')

        expect(page).to have_content("The Hulk")
    end
end
