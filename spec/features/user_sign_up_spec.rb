feature 'signup' do
    scenario 'a user can signup' do
        visit('/')
        click_link('Sign Up')

        fill_in('emailSignUp', with: 'lucy@example.com')
        fill_in('passwordSignUp', with: 'password0')
        fill_in('nameSignUp', with: 'Lucy')
        fill_in('userNameSignUp', with: 'lucygore')

        click_button('submitSignUp')

        expect(page).to have_content("LUCYGORE")
    end
end
