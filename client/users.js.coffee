Accounts.ui.config passwordSignupFields: "USERNAME_ONLY"
@getUsername = (id) ->
  Meteor.subscribe "user-info", id
  Deps.autorun ->
    user = Meteor.users.findOne(id)
    Session.set "user-" + id, user.username  if user
