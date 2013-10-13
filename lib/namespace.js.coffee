@chatCollection = new Meteor.Collection(null)  if Meteor.isClient
@chatStream = new Meteor.Stream("chat-stream")
