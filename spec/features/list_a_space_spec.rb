feature 'list a space' do
    scenario 'user can list a space' do

        visit('/spaces/new')

        fill_in('name', with: 'Lucia Gore')
        fill_in('description', with: 'Home for rent!')

        click_button('List My space')

        expect(page).to have_content('Lucia Gore')
        expect(page).to have_content('Home for rent!')

    end
end