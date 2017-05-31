feature 'adding links' do
  scenario 'adding site address and title' do
    visit '/links'
    click_button('Add new link')
    fill_in('URL', :with => 'https://www.facebook.com')
    fill_in('title', :with => 'Facebook')
    click_button('Add')
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content('Facebook')
    end
    DatabaseCleaner.clean
  end
end
