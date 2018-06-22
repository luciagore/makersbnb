feature 'request a space' do
    scenario 'a user can request a space using email details' do

        user = Users.create(email: 'lucy@example.com', password: 'password0', name: 'Lucy', username: 'lucygore')
        Spaces.create(name_of_space: 'Lucys House', email: 'lucy@example.com', description: 'this is a house description for lucys house', price_per_night: 40.00, user_id: user.id)

        log_in
        visit('/')
        click_link('book now!')

        fill_in('inputMessage', with: 'some message request')
        fill_in('inputEmail', with: 'example1@example.com')

        click_button('submitRequest')

        expect(page).to have_content("some message request")
        expect(page).to have_content("example1@example.com")

    end
end
