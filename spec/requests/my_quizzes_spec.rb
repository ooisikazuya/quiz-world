require 'rails_helper'

RSpec.describe "MyQuizzes", type: :request do
  describe 'GET #index' do
    before do
      @user = User.create(
        nickname: "testman",
        email: "testman@example.com",
        password: "password"
      )
    end

    it 'リクエストが成功すること' do
      sign_in @user
      get '/my_quizzes'
      expect(response.status).to eq 200
    end
  end
end