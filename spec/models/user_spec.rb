require 'rails_helper'

RSpec.describe User, type: :model do

  it "ニックネーム、メール、パスワードがある場合、有効である" do
    user = User.new(
      nickname: "testman",
      email: "testman@example.com",
      password: "password"
      )

      expect(user).to be_valid
  end
end