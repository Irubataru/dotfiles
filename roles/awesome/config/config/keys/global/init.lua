require("config.keys.global.mouse")
require("config.keys.global.tags")
require("config.keys.global.client")
require("config.keys.global.layout")
require("config.keys.global.awesome")
require("config.keys.global.modules")


-- local keys = {
--   mouse = require("config.keys.global.mouse"),
--   -- tags = require("config.keys.global.tags"),
--   -- client = require("config.keys.global.client"),
--   -- layout = require("config.keys.global.layout"),
--   -- awesome = require("config.keys.global.awesome"),
--   -- modules = require("config.keys.global.modules")
-- }
--
-- -- Cannot require them directly here because in lua 5.4 the require function
-- -- returns both the result and the location of the module, which messes up join
-- local global_keys = gears.table.join(
--   keys.mouse,
--   keys.tags,
--   keys.client,
--   keys.layout,
--   keys.awesome,
--   keys.modules
-- )
--
-- return global_keys
