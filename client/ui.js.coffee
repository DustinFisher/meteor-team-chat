Template.chatBox.helpers messages: ->
  chatCollection.find()


# get the value for handlerbar helper user
Template.chatMessage.helpers user: ->
  if @userId is "me"
    Meteor.user().username
  else if @userId
    getUsername @userId
    Session.get "user-" + @userId
  else
    "anonymous-" + @subscriptionId


# when Send Chat clicked at the message to the collection
Template.chatBox.events "click #send": ->
  message = $("#chat-message").val()
  chatCollection.insert
    userId: 'me'
    message: message

  $("#chat-message").val ""
  
  #add the message to the stream
  chatStream.emit "chat", message

chatStream.on "chat", (message) ->
  chatCollection.insert
    userId: @userId
    subscriptionId: @subscriptionId
    message: message
