json.array! @quizzes do |quiz|
  json.id quiz.id
  json.title quiz.title
  json.genre quiz.genre
  json.status quiz.status
  json.has_questions quiz.questions.present?
end