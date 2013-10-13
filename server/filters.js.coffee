chatStream.addFilter (eventName, args) ->
  if eventName is "chat"
    message = args[0]
    message = message.replace(/fool/g, "****")  if message
    [message]
  else
    args
