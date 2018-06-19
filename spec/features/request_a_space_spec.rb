feature 'list a space' do
    scenario 'a user can request a space using email details' do

        visit('/newrequest')

        fill_in('body', with: 'some message request')
        fill_in('email', with: 'test@email.com')

        click_button('Request')

        expect(page).to have_content("some message request")
        expect(page).to have_content("test@email.com")

    end
end
