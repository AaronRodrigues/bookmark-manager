feature 'User can sign up for an account ' do
  scenario 'Enters a email and password' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(current_path).to eq '/links'
    expect(page).to have_content ('Welcome, ben@jerrys.com')
    expect(User.first.email).to eq('ben@jerrys.com')
  end
end