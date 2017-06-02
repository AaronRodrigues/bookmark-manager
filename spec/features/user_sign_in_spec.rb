feature 'User can sign up for an account ' do
  scenario 'Enters a email and password' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, ben@jerrys.com')
    expect(User.first.email).to eq('ben@jerrys.com')
  end

  scenario 'Requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  def sign_up(email: 'ben@jerrys.com',
              password: '1234',
              password_confirmation: '1234')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button('Sign up')
  end

end
