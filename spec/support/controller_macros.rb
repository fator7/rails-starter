module ControllerMacros

  def login_user
    before(:each) do
      user = FactoryGirl.create(:user)
      auth_header = user.create_new_auth_token
      request.headers['accept'] = auth_header['accept']
      request.headers['access-token'] = auth_header['access-token']
      request.headers['client'] = auth_header['client']
      request.headers['uid'] = auth_header['uid']
    end
  end

end
