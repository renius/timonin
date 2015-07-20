require 'rails_helper'
require 'cancan/matchers'

describe Ability do
  let(:subject) { Ability.new(user) }
  let(:comment) { Comment.new(user: user) }

  describe 'for regular user' do
    let(:user) { create(:user) }
      it { is_expected.to be_able_to(:manage, comment) }
      it { is_expected.to_not be_able_to(:destroy, user) }
      it 'can not manage other user comments' do
        second_user = User.new
        comment = Comment.new(user: second_user)
        is_expected.to_not be_able_to(:manage, comment)
      end
  end

  describe 'for admin' do
    let(:user) { create(:user, role: 'admin') }
      it { is_expected.to be_able_to(:manage, :all) }
  end
end
