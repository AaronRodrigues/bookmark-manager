feature 'adding a tag to a link' do
  scenario ' link must have a tag' do
    visit '/links/new'
    fill_in('URL', with: 'https://www.facebook.com')
    fill_in('title', with: 'Facebook')
    fill_in('tags', with: 'red')
    click_button('Add')
    expect(current_path).to eq '/links'
    within 'ul#links' do
      link = Link.first
      expect(link.tags.map(&:name)).to include('red')
    end
  end
end

feature 'Adding multiple tags to a link' do
  scenario 'link must have the tags' do
    visit '/links/new'
    fill_in('URL', with: 'https://www.facebook.com')
    fill_in('title', with: 'Facebook')
    fill_in('tags', with: 'red social networking')
    click_button('Add')
    expect(current_path).to eq '/links'
    within 'ul#links' do
      link = Link.first
      expect(link.tags.map(&:name)).to include('red', 'social', 'networking')
    end
  end
end
