feature 'list a space' do
  scenario 'user can list a space' do
    log_in

    visit('/')
    click_link('List Space')

    fill_in('name_of_space', with: "Lucys house")
    fill_in('email', with: 'lucy@example.com')
    fill_in('description', with: 'Home for rent!')
    fill_in('price_per_night', with: '40')
    attach_file('file', File.absolute_path('./public/images/head.jpg'))
    click_button('Submit')
    expect(page).to have_content("Lucys house")
    expect(page).to have_content('Home for rent!')
    expect(page).to have_content('lucy@example.com')
    File.delete(File.absolute_path('./public/userimages/1head.jpg')) if File.exist?(File.absolute_path('./public/userimages/1head.jpg'))
  end
end
