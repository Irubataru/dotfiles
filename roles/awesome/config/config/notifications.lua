local ruled = require("ruled")

ruled.notification.connect_signal("request::rules", function()
  -- All notifications expire after 5 seconds
  -- TODO: Make it min(timeout, 5) somehow
  ruled.notification.append_rule({
    rule = {},
    properties = { timeout = 5 },
  })
end)
