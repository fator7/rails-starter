module ControllerMacros

  def login_user
    before(:each) do
      @user = FactoryGirl.create(:user)
      @request.headers.merge!(@user.create_new_auth_token)
    end
  end

end
