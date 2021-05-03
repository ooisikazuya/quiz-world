require 'rails_helper'

RSpec.describe Quiz, type: :model do
  before do
    @user = User.create(
      id: 1,
      nickname: "testman",
      email: "testman@example.com",
      password: "password"
    )
  end

  it "クイズ名、ジャンルがある場合、有効である" do
    quiz = Quiz.new(
      user_id: @user.id,
      title: "銀魂クイズ",
      genre: "銀魂"
      )

    expect(quiz).to be_valid
  end

  it "クイズ名がない場合、無効である" do
    quiz = Quiz.new(
      user_id: @user.id,
      title: nil,
      genre: "銀魂"
      )

    expect(quiz).not_to be_valid
  end

  it "ジャンルがない場合、無効である" do
    quiz = Quiz.new(
      user_id: @user.id,
      title: "銀魂クイズ",
      genre: nil
      )

    expect(quiz).not_to be_valid
  end
end