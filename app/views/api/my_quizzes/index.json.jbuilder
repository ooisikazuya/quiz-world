json.set! :quizzes do
  json.array! @quizzes do |quiz|
    json.extract! quiz, :id, :user_id, :title, :genre, :created_at, :updated_at, :status
  end
end