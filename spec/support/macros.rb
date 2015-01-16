module RequestMacros
  include Warden::Test::Helpers

  def sign_in_as_a_user(role = {role: nil})
    @user ||= FactoryGirl.create(:user, role.fetch(:role))
    login_as @user
  end
end
