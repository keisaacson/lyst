require 'spec_helper'

describe User do
   before do
    @user = User.create(email: "test@test.com", username: "tester", encrypted_password: "password")
  end

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:username) }
end
