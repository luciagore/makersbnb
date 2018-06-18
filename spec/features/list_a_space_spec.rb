feature 'list a space' do
  scenario 'user can list a space' do
    visit('/spaces/new')

    fill_in('name_of_space', with: "Lucys house")
    fill_in('email', with: 'test@example.com')
    fill_in('description', with: 'Home for rent!')

    click_button('List my space')

    expect(page).to have_content("Lucys house")
    expect(page).to have_content('Home for rent!')
    expect(page).to have_content('test@example.com')
  end
end
