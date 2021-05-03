require 'rails_helper'

RSpec.describe User, type: :model do

  it "ニックネーム、メール、パスワードがある場合、有効である" do
    user = build(:user)

    expect(user).to be_valid
  end

  it "ニックネームがない場合、無効である" do
    user = build(:user, nickname: nil)

    user.valid?

    expect(user.errors[:nickname]).to include("が入力されていません。")
  end

  it "メールアドレスがない場合、無効である" do
    user = build(:user, email: nil)

    user.valid?

    expect(user.errors[:email]).to include("が入力されていません。")
  end

  it "パスワードがない場合、無効である" do
    user = build(:user, password: nil)

    user.valid?

    expect(user.errors[:password]).to include("が入力されていません。")
  end
end