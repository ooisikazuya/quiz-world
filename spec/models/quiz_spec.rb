require 'rails_helper'

RSpec.describe Quiz, type: :model do
  describe 'validation' do
    before do
      @user = User.create(
        id: 1,
        nickname: "testman",
        email: "testman@example.com",
        password: "password"
      )
    end

    context 'クイズ名、ジャンルがある場合' do
      it "有効である" do
        quiz = Quiz.new(
          user_id: @user.id,
          title: "銀魂クイズ",
          genre: "銀魂"
          )

        expect(quiz).to be_valid
      end
    end

    context 'クイズ名がない場合' do
      it "無効である" do
        quiz = Quiz.new(
          user_id: @user.id,
          title: nil,
          genre: "銀魂"
          )

        expect(quiz).not_to be_valid
      end
    end

    context 'ジャンルがない場合' do
      it "無効である" do
        quiz = Quiz.new(
          user_id: @user.id,
          title: "銀魂クイズ",
          genre: nil
          )

        expect(quiz).not_to be_valid
      end
    end
  end

  describe 'search' do
    let!(:quiz_1) { create(:quiz, genre: 'アニメ1') }
    let!(:quiz_2) { create(:quiz, genre: 'アニメ2') }
    let!(:quiz_3) { create(:quiz) }
    let!(:quiz_4) { create(:quiz, status: 'before_release') }
    let!(:quiz_5) { create(:quiz, status: 'deleted') }

    subject { Quiz.search(search) }

    context 'searchがnilの場合' do
      let(:search) { nil }

      it 'releasedのQuizをすべて返す' do
        expect(subject.map(&:id)).to match [quiz_1.id, quiz_2.id, quiz_3.id]
      end
    end

    context 'searchがnilでない場合' do
      let(:search) { 'アニメ' }

      it 'genreにsearchの文字が含まれているreleasedのQuizをすべて返す' do
        expect(subject.map(&:id)).to match [quiz_1.id, quiz_2.id]
      end
    end
  end
end