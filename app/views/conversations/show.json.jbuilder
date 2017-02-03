json.conversation @conversation
json.user_messages @user_messages do |message|
  json.message message
  json.user message.user
end
