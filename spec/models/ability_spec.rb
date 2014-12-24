require 'rails_helper'
require 'cancan/matchers'

describe Ability do
  describe 'for regular user' do
    let(:user) { FactoryGirl.create(:user) }

      it 'allows to crud comments' do
        ability = Ability.new(user)
        comment = Comment.new(user: user)
        expect(ability).to be_able_to(:manage, comment)
      end

      it 'can not destroy user' do
        ability = Ability.new(user)
        comment = Comment.new(user: user)
        expect(ability).to_not be_able_to(:destroy, user)
      end

      it 'can not manage other user comments' do
        second_user = User.new
        ability = Ability.new(user)
        comment = Comment.new(user: second_user)
        expect(ability).to_not be_able_to(:manage, comment)
      end
  end

  describe 'for admin' do
    let(:user) { FactoryGirl.create(:user, role: 'admin') }

      it 'to manage all' do
        ability = Ability.new(user)
        comment = Comment.new(user: user)
        expect(ability).to be_able_to(:manage, :all)
      end
  end
end
