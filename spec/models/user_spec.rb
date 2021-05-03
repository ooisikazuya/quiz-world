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

  it "ニックネームがない場合、無効である" do
    user = User.new(
      nickname: nil,
      email: "testman@example.com",
      password: "password"
      )

    user.valid?

    expect(user.errors[:nickname]).to include("が入力されていません。")
  end

  it "メールアドレスがない場合、無効である" do
    user = User.new(
      nickname: "testman",
      email: nil,
      password: "password"
      )

    user.valid?

    expect(user.errors[:email]).to include("が入力されていません。")
  end

  it "パスワードがない場合、無効である" do
    user = User.new(
      nickname: "testman",
      email: "testman@example.com",
      password: nil
      )

    user.valid?

    expect(user.errors[:password]).to include("が入力されていません。")
  end
end