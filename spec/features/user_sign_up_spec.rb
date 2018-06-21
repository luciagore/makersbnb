feature 'signup' do
    scenario 'a user can signup' do
        visit('/')
        click_link('Sign Up')

        fill_in('email', with: 'lucy@example.com')
        fill_in('password', with: 'password0')
        fill_in('name', with: 'Lucy')
        fill_in('username', with: 'lucygore')

        click_button('submit')

        expect(page).to have_content("You are signed in as lucygore")
    end
end
