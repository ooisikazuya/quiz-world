json.set! :user do
  json.extract! @user, :id, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :created_at, :updated_at, :nickname, :icon
end
