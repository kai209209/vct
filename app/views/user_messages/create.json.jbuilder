json.conversation @conversation
json.user_message do
  json.message @user_message
  json.user current_user
end
