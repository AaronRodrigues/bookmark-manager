feature 'filtering by tag' do
  scenario 'only links with a specific tag are listed' do
    visit '/links/new'
    fill_in('URL', :with => 'https://www.facebook.com')
    fill_in('title', :with => 'Facebook')
    fill_in('tags', :with => 'bubbles')
    click_button('Add')
    visit('/tags/bubbles')
    within 'ul#links' do
      link = Link.all(:tags => { :name => 'bubbles' }) 
      expect(link.tags.map(&:name)).to include('bubbles')
    end
  end
end