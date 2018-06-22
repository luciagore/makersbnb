feature 'list a space' do
  scenario 'user can list a space' do
    log_in

    visit('/')
    click_link('List Space')

    fill_in('name_of_space', with: "Lucys house")
    fill_in('email', with: 'lucy@example.com')
    fill_in('description', with: 'Home for rent!')
    fill_in('price', with: '40')

    click_button('List my space')
    expect(page).to have_content("Lucys house")
    expect(page).to have_content('Home for rent!')
    expect(page).to have_content('lucy@example.com')
  end
end
