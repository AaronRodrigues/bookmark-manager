def sign_up
  visit('/users/new')
    fill_in('email', :with => 'ben@jerrys.com')
    fill_in('password', :with => '1234')
    click_button('Sign up')
end