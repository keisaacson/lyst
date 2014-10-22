require 'spec_helper'

describe Share do
   before do
    @user = User.new(email: "test@test.com", username: "tester")
    @list = List.new(title: "My List", list_type: "private", user_id: @user.id)
    @share = Share.new(list_id: @list.id, user_id: @user.id, share_access: 'read', favorite: 'no')
  end

  subject { @share }

  it { should respond_to(:user_id) }
  it { should respond_to(:list_id) }
  it { should respond_to(:share_access) }
  it { should respond_to(:favorite) }
  it { should be_valid }
end
