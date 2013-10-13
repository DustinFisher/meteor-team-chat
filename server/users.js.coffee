Meteor.publish "user-info", (id) ->
  Meteor.users.find
    _id: id
  ,
    fields:
      username: 1
