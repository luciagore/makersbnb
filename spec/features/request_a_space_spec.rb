feature 'request a space' do
    scenario 'a user can request a space using email details' do

        Spaces.create(name_of_space: 'Lucys House', email: 'test@test.com', description: 'this is a house description for lucys house')
        visit('/')
        click_link('book now!')

        fill_in('body', with: 'some message request')
        fill_in('email', with: 'test@email.com')

        click_button('Request')
        
        expect(page).to have_content("some message request")
        expect(page).to have_content("test@email.com")

    end
end
