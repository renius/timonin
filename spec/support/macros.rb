module RequestMacros
  include Warden::Test::Helpers

  def sign_in_as_a_user(args = {})
    @user ||= FactoryGirl.create(:user, args[:role])
    login_as @user
  end
end
